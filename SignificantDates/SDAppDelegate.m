//
//  SDAppDelegate.m
//  SignificantDates
//
//  Created by Chris Wagner on 5/14/12.
//

#import "SDAppDelegate.h"
#import "SDSyncEngine.h"
#import "OrderHeader.h"
#import "OrderDetail.h"
#import <Parse/Parse.h>

@implementation SDAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[SDSyncEngine sharedEngine] registerNSManagedObjectClassToSync:[OrderHeader class]];
    [[SDSyncEngine sharedEngine] registerNSManagedObjectClassToSync:[OrderDetail class]];
    
    [Parse setApplicationId:@"YZhdrvlX8xE4wNtQJukffxU0kjWwqg267gAZGDxC"
                  clientKey:@"i4Em0VLhGwblNx7j9oYO2DMDLkaydVgXp6lDrc7z"];

    [MagicalRecord setupCoreDataStackWithStoreNamed:@"SignificantDates.sqlite"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [[SDSyncEngine sharedEngine] startSync];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
 [MagicalRecord cleanUp];
}

@end
