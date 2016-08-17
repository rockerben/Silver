#import "OrderHeader.h"
#import "NSManagedObject+JSON.h"
#import "SDSyncEngine.h"


@interface OrderHeader ()

// Private interface goes here.

@end


@implementation OrderHeader

@dynamic objectId; //parse ID
@dynamic date; //parse
@dynamic orderDesc; //parse details
@dynamic image; //not in parse yet
@dynamic accountName; //parse
@dynamic observedBy;
//@dynamic wikipediaLink;

@dynamic createdAt;
@dynamic updatedAt;
@dynamic syncStatus;

- (NSDictionary *)JSONToCreateObjectOnServer {
    NSDictionary *date = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Date", @"__type",
                          [[SDSyncEngine sharedEngine] dateStringForAPIUsingDate:self.date], @"iso" , nil];
    
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    self.accountName, @"accountName",
                                    self.orderDesc, @"orderDesc",
                                    //self.wikipediaLink, @"wikipediaLink",
                                    date, @"date", nil];
    return jsonDictionary;
}



@end
