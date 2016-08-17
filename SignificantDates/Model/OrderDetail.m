#import "OrderDetail.h"
#import "NSManagedObject+JSON.h"
#import "SDSyncEngine.h"

@interface OrderDetail ()

// Private interface goes here.

@end


@implementation OrderDetail

// Custom logic goes here.






@dynamic objectId; //parse ID
@dynamic date; //parse
@dynamic itemName; //parse details

@dynamic quantity; //parse
//@dynamic observedBy;
//@dynamic wikipediaLink;

@dynamic createdAt; //
@dynamic updatedAt;
@dynamic syncStatus;

- (NSDictionary *)JSONToCreateObjectOnServer {
    NSDictionary *date = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Date", @"__type",
                          [[SDSyncEngine sharedEngine] dateStringForAPIUsingDate:self.date], @"iso" , nil];
    
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    self.itemName, @"itemName",
                                    self.quantity, @"quantity",
                                    //self.wikipediaLink, @"wikipediaLink",
                                    date, @"date", nil];
    return jsonDictionary;
}


@end