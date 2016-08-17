//
//  QKOrderTableViewController.h
//  SignificantDates
//
//  Created by Ben on 11/09/2014.
//
//

#import <UIKit/UIKit.h>


@interface QKOrderTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *dates;
@property (nonatomic, strong) NSString *entityName;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
- (IBAction)refreshButtonTouched:(id)sender;



@end
