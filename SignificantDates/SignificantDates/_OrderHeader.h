// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderHeader.h instead.

#import <CoreData/CoreData.h>


extern const struct OrderHeaderAttributes {
	__unsafe_unretained NSString *accountName;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *objectId;
	__unsafe_unretained NSString *observedBy;
	__unsafe_unretained NSString *orderDesc;
	__unsafe_unretained NSString *syncStatus;
	__unsafe_unretained NSString *updatedAt;
} OrderHeaderAttributes;

extern const struct OrderHeaderRelationships {
	__unsafe_unretained NSString *orderNumber;
} OrderHeaderRelationships;

extern const struct OrderHeaderFetchedProperties {
} OrderHeaderFetchedProperties;

@class OrderDetail;






@class NSObject;




@interface OrderHeaderID : NSManagedObjectID {}
@end

@interface _OrderHeader : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OrderHeaderID*)objectID;





@property (nonatomic, strong) NSString* accountName;



//- (BOOL)validateAccountName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* image;



//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* objectId;



//- (BOOL)validateObjectId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) id observedBy;



//- (BOOL)validateObservedBy:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* orderDesc;



//- (BOOL)validateOrderDesc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* syncStatus;



@property int16_t syncStatusValue;
- (int16_t)syncStatusValue;
- (void)setSyncStatusValue:(int16_t)value_;

//- (BOOL)validateSyncStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OrderDetail *orderNumber;

//- (BOOL)validateOrderNumber:(id*)value_ error:(NSError**)error_;





@end

@interface _OrderHeader (CoreDataGeneratedAccessors)

@end

@interface _OrderHeader (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccountName;
- (void)setPrimitiveAccountName:(NSString*)value;




- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSData*)primitiveImage;
- (void)setPrimitiveImage:(NSData*)value;




- (NSString*)primitiveObjectId;
- (void)setPrimitiveObjectId:(NSString*)value;




- (id)primitiveObservedBy;
- (void)setPrimitiveObservedBy:(id)value;




- (NSString*)primitiveOrderDesc;
- (void)setPrimitiveOrderDesc:(NSString*)value;




- (NSNumber*)primitiveSyncStatus;
- (void)setPrimitiveSyncStatus:(NSNumber*)value;

- (int16_t)primitiveSyncStatusValue;
- (void)setPrimitiveSyncStatusValue:(int16_t)value_;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;





- (OrderDetail*)primitiveOrderNumber;
- (void)setPrimitiveOrderNumber:(OrderDetail*)value;


@end
