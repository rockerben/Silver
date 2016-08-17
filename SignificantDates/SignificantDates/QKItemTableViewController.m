//
//  QKItemTableViewController.m
//  SignificantDates
//
//  Created by Ben on 24/09/2014.
//
//



//
//  MyTableController.m
//  ParseStarterProject
//
//  Created by James Yu on 12/29/11.
//

#import "QKItemTableViewController.h"
#import "Item.h"



@interface QKItemTableViewController () <UISearchDisplayDelegate, UISearchBarDelegate>{}

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchDisplayController *searchController;
@property (nonatomic, strong) NSMutableArray * searchResults;

//- (void)persistCloudItemFileToLocalItemFilewithItem:(NSString *)itemCode itemDescription:(NSString *)itemDescription;

@end

@implementation QKItemTableViewController
@synthesize delegate;





- (id)initWithCoder:(NSCoder *)aCoder {
    self = [super initWithCoder:aCoder];
    if (self) {
        // Customize the table
        
        // The className to query on
        self.parseClassName = @"Item";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"itemName";
        
        // Uncomment the following line to specify the key of a PFFile on the PFObject to display in the imageView of the default cell style
        // self.imageKey = @"image";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 1000;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    self.tableView.tableHeaderView = self.searchBar;
    self.searchController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    self.searchController.searchResultsDataSource = self;
    self.searchController.searchResultsDelegate = self;
    self.searchController.delegate = self;
    CGPoint offset = CGPointMake(0, self.searchBar.frame.size.height);
    self.tableView.contentOffset = offset;
    self.searchResults = [NSMutableArray array];




}

-(void)filterResults: (NSString *)searchTerm {
    
    [self.searchResults  removeAllObjects];
    PFQuery *query = [PFQuery queryWithClassName:@"Item"];
    [query whereKeyExists:@"itemName"];
    [query whereKey:@"itemName" containsString:searchTerm];
    
    NSArray *results = [query findObjects];
    [self.searchResults addObjectsFromArray:results];
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [self filterResults:searchString];
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.tableView) {
        return self.objects.count;
        
    }   else {
    
        return self.searchResults.count;
    }
            
            
}

-(void)callbackLoadObjectsFromParse:(NSArray*)result error:(NSError*)error{
    
    if(!error){
        [self.searchResults removeAllObjects];
        [self.searchResults addObjectsFromArray:result];
        [self.searchDisplayController.searchResultsTableView reloadData];
    } else {
        NSLog(@"Error: %@ %@", error,[error userInfo]);
    }
    
}


    



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


-(void)findAllObjectsWithQuery:(PFQuery *)query withBlock:(void (^)(NSArray *objects, NSError *error))block
{
    __block NSMutableArray *allObjects = [NSMutableArray array];
    __block NSUInteger limit = 1000;
    __block NSUInteger skip = 0;
    
    typedef void  (^FetchNextPage)(void);
    FetchNextPage __block weakPointer;
    
    FetchNextPage strongBlock = ^(void)
    {
        [query setLimit: limit];
        [query setSkip: skip];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                // The find succeeded. Add the returned objects to allObjects
                [allObjects addObjectsFromArray:objects];
                
                if (objects.count == limit) {
                    // There might be more objects in the table. Update the skip value and execute the query again.
                    skip += limit;
                    [query setSkip: skip];
                    // Go get more results
                    weakPointer();
                }
                else
                {
                    // We are done so return the objects
                    block(allObjects, nil);
                }
                
            }
            else
            {
                block(nil,error);
            }
        }];
    };
    
    weakPointer = strongBlock;
    strongBlock();
    
}



/*
- (IBAction)blueArrow:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"item"];
    
    [self findAllObjectsWithQuery:query withBlock:^(NSArray *objects, NSError *error) {
        if(!error)
        {
            NSLog(@"Loaded All Objects: %i",objects.count);
            
            //now update item file with array of item objects using for in statement
            for (id  eachObject in objects)
            {
                
                NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
                
                // Build the predicate to find record
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"itemCode == %@", [eachObject objectForKey:@"ITEMNO"]];
                
                Item *itemFounded = [Item MR_findFirstWithPredicate:predicate inContext:localContext];
                
                // If an item was NOT found in item core data file, then update
                if (!itemFounded)
                {
                    // Update
                    
                    [self persistCloudItemFileToLocalItemFilewithItem:[eachObject objectForKey:@"ITEMNO"]
                                                      itemDescription:[eachObject objectForKey:@"DESCRIPTION"]];
                }
                else
                {
                    //NSLog(@"Object: %@", eachObject);
                }
                
            }
            
        }
    }];
    
    
    
    
}



- (void)persistCloudItemFileToLocalItemFilewithItem:(NSString *)itemCode itemDescription:(NSString *)itemDescription
{
    // Get the local context
    NSManagedObjectContext *localContextItem    = [NSManagedObjectContext MR_contextForCurrentThread];
    
    // Create a new Person in the current thread context
    Item *item                              = [Item MR_createInContext:localContextItem];
    item.itemCode                           = itemCode;
    item.itemDescription                    = itemDescription;
    
    // Save the modification in the local context
    [localContextItem MR_saveToPersistentStoreAndWait];
}
*/




- (IBAction)cancel:(id)sender
{
    [self.delegate itemTableControllerDidCancel:self];
}

#pragma mark - Parse

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
    
    // This method is called every time objects are loaded from Parse via the PFQuery
}

- (void)objectsWillLoad {
    [super objectsWillLoad];
    
    // This method is called before a PFQuery is fired to get more objects
}


// Override to customize what kind of query to perform on the class. The default is to query for
// all objects ordered by createdAt descending.
- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if ([self.objects count] == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    //[query orderByAscending:@"ITEMNO"];
    
    return query;
}



// Override to customize the look of a cell representing an object. The default is to display
// a UITableViewCellStyleDefault style cell with the label being the first key in the object.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if (tableView == self.tableView) {
    
    // Configure the cell
    cell.textLabel.text = [object objectForKey:@"itemName"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"category: %@", [object objectForKey:@"itemDescription"]];
    
    }
    
    else if(tableView == self.searchDisplayController.searchResultsTableView) {
        PFObject *searchedUser = [self.searchResults objectAtIndex:indexPath.row];
        
        cell.textLabel.text = [searchedUser objectForKey:@"itemName"];
    }
    
    
    
    return cell;
}


/*
 // Override if you need to change the ordering of objects in the table.
 - (PFObject *)objectAtIndex:(NSIndexPath *)indexPath {
 return [objects objectAtIndex:indexPath.row];
 }
 */

/*
 // Override to customize the look of the cell that allows the user to load the next page of objects.
 // The default implementation is a UITableViewCellStyleDefault cell with simple labels.
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath {
 static NSString *CellIdentifier = @"NextPage";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 cell.selectionStyle = UITableViewCellSelectionStyleNone;
 cell.textLabel.text = @"Load more...";
 
 return cell;
 }
 */

#pragma mark - Table view data source

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
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
}


@end
