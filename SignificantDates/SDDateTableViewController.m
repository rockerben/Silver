//
//  SDDateTableViewController.m
//  SignificantDates
//
//  Created by Chris Wagner on 6/1/12.
//

#import "SDDateTableViewController.h"
#import "SDCoreDataController.h"
#import "SDTableViewCell.h"
#import "SDAddDateViewController.h"
#import "SDDateDetailViewController.h"
#import "OrderHeader.h"
#import "Birthday.h"
#import "SDSyncEngine.h"


#import "Item.h"


@interface SDDateTableViewController ()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end

@implementation SDDateTableViewController

@synthesize dateFormatter;
@synthesize managedObjectContext;

@synthesize entityName;
@synthesize dates;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadRecordsFromCoreData {
    [self.managedObjectContext performBlockAndWait:^{
        [self.managedObjectContext reset];
        NSError *error = nil;
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:self.entityName];
        [request setSortDescriptors:[NSArray arrayWithObject:
                                     [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]]];
        // 1
        [request setPredicate:[NSPredicate predicateWithFormat:@"syncStatus != %d", SDObjectDeleted]];
        self.dates = [self.managedObjectContext executeFetchRequest:request error:&error];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.managedObjectContext = [[SDCoreDataController sharedInstance] newManagedObjectContext];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    [self loadRecordsFromCoreData];
    
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background1.png"]];
    //[self.tableView setBackgroundView:imageView];
   
    // Update the entity in the block of saveWithBlock:
 //   [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        //Item *person = [Item MR_createInContext:localContext];
        //person.itemName                        = @"item name1";
      //  person.itemDescription                   = @"item desc1";        // That's all to updating
 //   }];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self checkSyncStatus];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"SDSyncEngineSyncCompleted" object:nil queue:nil usingBlock:^(NSNotification *note) {
        [self loadRecordsFromCoreData];
        [self.tableView reloadData];
    }];
    [[SDSyncEngine sharedEngine] addObserver:self forKeyPath:@"syncInProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SDSyncEngineSyncCompleted" object:nil];
    [[SDSyncEngine sharedEngine] removeObserver:self forKeyPath:@"syncInProgress"];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObject *date = [self.dates objectAtIndex:indexPath.row];
        [self.managedObjectContext performBlockAndWait:^{
            // 1
            //the following test verifies if the object actually exists on the server
            if ([[date valueForKey:@"objectId"] isEqualToString:@""] ||
                [date valueForKey:@"objectId"] == nil) {
                
                [self.managedObjectContext deleteObject:date];
                
            } else {
                
                [date setValue:[NSNumber numberWithInt:SDObjectDeleted] forKey:@"syncStatus"];
                
            }
            NSError *error = nil;
            BOOL saved = [self.managedObjectContext save:&error];
            if (!saved) {
                NSLog(@"Error saving main context: %@", error);
            }
            
            [[SDCoreDataController sharedInstance] saveMasterContext];
            [self loadRecordsFromCoreData];
            [self.tableView reloadData];
            [[SDSyncEngine sharedEngine] startSync];
        }];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dates count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SDTableViewCell *cell = nil;
    
    if ([self.entityName isEqualToString:@"OrderHeader"]) {
        static NSString *CellIdentifier = @"OrderHeaderCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
       
        
        OrderHeader *order = [self.dates objectAtIndex:indexPath.row];
        cell.nameLabel.text = order.accountName;
        cell.dateLabel.text = [self.dateFormatter stringFromDate:order.date];
        if (order.image != nil) {
            UIImage *image = [UIImage imageWithData:order.image];
            cell.imageView.image = image;
        } else {
            cell.imageView.image = nil;
        }
    } else { // Birthday
        static NSString *CellIdentifier = @"BirthdayCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        Birthday *birthday = [self.dates objectAtIndex:indexPath.row];
        cell.nameLabel.text = birthday.name;
        cell.dateLabel.text = [self.dateFormatter stringFromDate:birthday.date];
        if (birthday.image != nil) {
            UIImage *image = [UIImage imageWithData:birthday.image];
            cell.imageView.image = image;
        } else {
            cell.imageView.image = nil;
        }
    }
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowOrderViewSegue"]) {
        
        SDDateDetailViewController *dateDetailViewController = segue.destinationViewController;
        SDTableViewCell *cell = (SDTableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        OrderHeader *orderHeader = [self.dates objectAtIndex:indexPath.row];
        dateDetailViewController.managedObjectId = orderHeader.objectID;
        
        
        
    } else if ([segue.identifier isEqualToString:@"ShowAddDateViewSegue"]) {
        SDAddDateViewController *addDateViewController = segue.destinationViewController;
        [addDateViewController setAddDateCompletionBlock:^{
            [self loadRecordsFromCoreData]; 
            [self.tableView reloadData];
            [[SDSyncEngine sharedEngine] startSync];
        }];
        
    }
}

- (IBAction)refreshButtonTouched:(id)sender {
    [[SDSyncEngine sharedEngine] startSync];
}

- (void)checkSyncStatus {
    if ([[SDSyncEngine sharedEngine] syncInProgress]) {
        [self replaceRefreshButtonWithActivityIndicator];
    } else {
        [self removeActivityIndicatorFromRefreshButton];
    }
}

- (void)replaceRefreshButtonWithActivityIndicator {
//    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin)];
    [activityIndicator startAnimating];
    UIBarButtonItem *activityItem = [[UIBarButtonItem alloc] initWithCustomView:activityIndicator];
    self.navigationItem.leftBarButtonItem = activityItem;
}

- (void)removeActivityIndicatorFromRefreshButton {
    self.navigationItem.leftBarButtonItem = self.refreshButton;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"syncInProgress"]) {
        [self checkSyncStatus];
    }
}

@end
