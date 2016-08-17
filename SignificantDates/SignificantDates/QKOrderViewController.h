//
//  QKOrderViewController.h
//  SignificantDates
//
//  Created by Ben on 11/09/2014.
//
//

#import <UIKit/UIKit.h>

#import "QKOrderTableViewController.h"
#import "SDSyncEngine.h"


@interface QKOrderViewController : UIViewController {
    
        

    IBOutlet UIView *pullRightView;
}
@property (copy, nonatomic) void (^addDateCompletionBlock)(void);
    
@property (strong, nonatomic) NSString *entityName;



@end
