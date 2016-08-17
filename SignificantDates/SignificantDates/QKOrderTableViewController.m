//
//  QKOrderTableViewController.m
//  SignificantDates
//
//  Created by Ben on 11/09/2014.
//
//

#import "QKOrderTableViewController.h"

#import "SDCoreDataController.h"
#import "SDTableViewCell.h"
#import "SDAddDateViewController.h"
#import "SDDateDetailViewController.h"
#import "OrderDetail.h"
#import "Birthday.h"
#import "SDSyncEngine.h"
#import "SDAppDelegate.h"



@interface QKOrderTableViewController ()


@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


//@property (nonatomic, strong) NSManagedObject *date; //ben

@end

@implementation QKOrderTableViewController



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
       //[request setPredicate:[NSPredicate predicateWithFormat:@"syncStatus != %d", SDObjectDeleted]];
        self.dates = [self.managedObjectContext executeFetchRequest:request error:&error];
    }];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.managedObjectContext = [[SDCoreDataController sharedInstance] newManagedObjectContext];
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    [self loadRecordsFromCoreData];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postWasCreated:) name:kPAWPostCreatedNotification object:nil];
    
    /*
    
    
    // Do any additional setup after loading the view.
    self.managedObjectContext = [[SDCoreDataController sharedInstance] newManagedObjectContext];
    self.date = [NSEntityDescription insertNewObjectForEntityForName:self.entityName inManagedObjectContext:self.managedObjectContext];

    
   // if (![self.nameTextField.text isEqualToString:@""] && self.datePicker.date) {
     //   [self.date setValue:self.nameTextField.text forKey:@"accountName"];
       [self.date setValue:[NSDate date] forKey:@"date"];
        // Set syncStatus flag to SDObjectCreated
        [self.date setValue:[NSNumber numberWithInt:SDObjectCreated] forKey:@"syncStatus"];
        
        if ([self.entityName isEqualToString:@"OrderDetail"]) {
            [self.date setValue:@"7002" forKey:@"itemName"];
            [self.date setValue:[NSNumber numberWithInt:1] forKey:@"quantity"];
            
            //[self.date setValue:self.option2TextField.text forKey:@""];
        }
        [self.managedObjectContext performBlockAndWait:^{
            NSError *error = nil;
            BOOL saved = [self.managedObjectContext save:&error];
            if (!saved) {
                // do some real error handling
                NSLog(@"Could not save Date due to %@", error);
            }
            [[SDCoreDataController sharedInstance] saveMasterContext];
        }];
    */
    
    
    
    
    
    
    
    
    
    
    
    
}


- (void)postWasCreated:(NSNotification *)note {
    NSLog(@"came thru here!");
    [self loadRecordsFromCoreData];
     [self.tableView reloadData];
 [[SDSyncEngine sharedEngine] startSync];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


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
    
    if ([self.entityName isEqualToString:@"OrderDetail"]) {
        static NSString *CellIdentifier = @"OrderDetailCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        OrderDetail *orderDetail = [self.dates objectAtIndex:indexPath.row];
        cell.nameLabel.text = orderDetail.itemName;
        cell.dateLabel.text = [self.dateFormatter stringFromDate:orderDetail.date];
       /* if (order.image != nil) {
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
        } */
        
    }
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowOrderViewSegue"]) {
        
      /*  SDDateDetailViewController *dateDetailViewController = segue.destinationViewController;
        SDTableViewCell *cell = (SDTableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        OrderDetail *orderDetail = [self.dates objectAtIndex:indexPath.row];
        dateDetailViewController.managedObjectId = orderDetail.objectId; */
        
        
        
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



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
