//
//  QKItemTableViewController.h
//  SignificantDates
//
//  Created by Ben on 24/09/2014.
//
//

#import <UIKit/UIKit.h>



//
//  MyTableController.h
//  ParseStarterProject
//
//  Created by James Yu on 12/29/11.
//

#import <Parse/Parse.h>

@class QKItemTableViewController;

@protocol QKItemTableViewControllerDelegate <NSObject>

- (void)itemTableControllerDidCancel:(QKItemTableViewController *)controller;
@end

@interface QKItemTableViewController: PFQueryTableViewController <UISearchBarDelegate, UISearchDisplayDelegate>


@property (nonatomic, weak) id <QKItemTableViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
//- (IBAction)blueArrow:(id)sender;


-(void)findAllObjectsWithQuery:(PFQuery *)query withBlock:(void (^)(NSArray *objects, NSError *error))block;


@end
