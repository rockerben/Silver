//
//  QKOrderViewController.m
//  SignificantDates
//
//  Created by Ben on 11/09/2014.
//
//

#import "QKOrderViewController.h"
#import "QKOrderTableViewController.h"
#import "WUDemoKeyboardBuilder.h"
#import "SDCoreDataController.h"
#import "SDAppDelegate.h"
#import "OrderDetail.h"

@interface QKOrderViewController ()
@property (nonatomic, weak) QKOrderTableViewController *containerViewController;







@property (weak, nonatomic) IBOutlet UITextField *enterItem;
@property (weak, nonatomic) IBOutlet UITextField *enterQty;



@end

@implementation QKOrderViewController

@synthesize addDateCompletionBlock;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (IBAction)switchKeyboard:(id)sender {
    if (self.enterItem.isFirstResponder) {
        if (self.enterItem.emoticonsKeyboard) [self.enterItem switchToDefaultKeyboard];
        else [self.enterItem switchToEmoticonsKeyboard:[WUDemoKeyboardBuilder sharedEmoticonsKeyboard]];
    }else{
        [self.enterItem switchToEmoticonsKeyboard:[WUDemoKeyboardBuilder sharedEmoticonsKeyboard]];
        [self.enterItem becomeFirstResponder];
    }

}


- (IBAction)addItem:(id)sender {
    
    
    //kick out if textField and qty is nil
        if ([self.enterItem.text isEqual: @""] && [self.enterQty.text isEqual: @""])
        {
            UIAlertView *cannotSaveAlert = [[UIAlertView alloc] initWithTitle:@"Uh oh..." message:@"You must at least set a name and date" delegate:nil cancelButtonTitle:@"Duh" otherButtonTitles:nil];
            [cannotSaveAlert show];
            return;
        }
    
    //kick out if textField is nil
    if ([self.enterItem.text isEqual: @""])
    {
        UIAlertView *cannotSaveAlert = [[UIAlertView alloc] initWithTitle:@"Uh oh..." message:@"You must at least set a name and date" delegate:nil cancelButtonTitle:@"Duh" otherButtonTitles:nil];
        [cannotSaveAlert show];
        return;
    }

    
    

    if (![self.enterItem.text isEqualToString:@""] && ![self.enterQty.text isEqualToString:@""]) {
        

        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            OrderDetail *orderDet = [OrderDetail  MR_createInContext:localContext];
            orderDet.itemName = self.enterItem.text;
            orderDet.date = [NSDate date];
            orderDet.syncStatus =[NSNumber numberWithInt:SDObjectCreated];
            orderDet.quantity = [NSNumber numberWithInt:[self.enterQty.text  intValue]];
        }];
         
        
       // [self.date setValue:self.enterItem.text forKey:@"itemName"];
       // [self.date setValue:[NSDate date] forKey:@"date"];
        
        // Set syncStatus flag to SDObjectCreated
        //[self.date setValue:[NSNumber numberWithInt:SDObjectCreated] forKey:@"syncStatus"];
      //  [self.date setValue:1 forKey:@"itemQty"];
        
        //[self.date setValue:self.option2TextField.text forKey:@""];
        
        //SAVE record!!!!!
     /*
        [self.managedObjectContext performBlockAndWait:^{
            NSError *error = nil;
            BOOL saved = [self.managedObjectContext save:&error];
            if (!saved) {
                // do some real error handling
                NSLog(@"Could not save Date due to %@", error);
            }
            [[SDCoreDataController sharedInstance] saveMasterContext];
        }];
        
        NSLog(@"Successfully saved!");
      
      
      */
      
        //NSLog(@"%@", postObject);
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:kPAWPostCreatedNotification object:nil];
        });
        
       // [self.navigationController popViewControllerAnimated:YES];
        //addDateCompletionBlock();
        
        
    }
         else {
             UIAlertView *cannotSaveAlert = [[UIAlertView alloc] initWithTitle:@"Uh oh..." message:@"You must at least set a name and date" delegate:nil cancelButtonTitle:@"Duh" otherButtonTitles:nil];
             [cannotSaveAlert show];
        }
}
         
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.entityName = @"OrderDetail";
    // Do any additional setup after loading the view.
    
    
    /*
    self.managedObjectContext = [[SDCoreDataController sharedInstance] newManagedObjectContext];
    self.date = [NSEntityDescription insertNewObjectForEntityForName:self.entityName inManagedObjectContext:self.managedObjectContext];
    */
    
    
    UISwipeGestureRecognizer *down = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(downBoy)];
    [down setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:down];
    


}


- (void)downBoy{
    [self.enterItem resignFirstResponder];
    [self.enterQty resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
    
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    return YES;
}


@end
