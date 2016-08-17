// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderDetail.h instead.

#import <CoreData/CoreData.h>


extern const struct OrderDetailAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *itemName;
	__unsafe_unretained NSString *objectId;
	__unsafe_unretained NSString *quantity;
	__unsafe_unretained NSString *syncStatus;
	__unsafe_unretained NSString *updatedAt;
} OrderDetailAttributes;

extern const struct OrderDetailRelationships {
	__unsafe_unretained NSString *orderNumber;
} OrderDetailRelationships;

extern const struct OrderDetailFetchedProperties {
} OrderDetailFetchedProperties;

@class OrderHeader;









@interface OrderDetailID : NSManagedObjectID {}
@end

@interface _OrderDetail : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OrderDetailID*)objectID;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* itemName;



//- (BOOL)validateItemName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* objectId;



//- (BOOL)validateObjectId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* quantity;



@property int16_t quantityValue;
- (int16_t)quantityValue;
- (void)setQuantityValue:(int16_t)value_;

//- (BOOL)validateQuantity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* syncStatus;



@property int16_t syncStatusValue;
- (int16_t)syncStatusValue;
- (void)setSyncStatusValue:(int16_t)value_;

//- (BOOL)validateSyncStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) OrderHeader *orderNumber;

//- (BOOL)validateOrderNumber:(id*)value_ error:(NSError**)error_;





@end

@interface _OrderDetail (CoreDataGeneratedAccessors)

@end

@interface _OrderDetail (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveItemName;
- (void)setPrimitiveItemName:(NSString*)value;




- (NSString*)primitiveObjectId;
- (void)setPrimitiveObjectId:(NSString*)value;




- (NSNumber*)primitiveQuantity;
- (void)setPrimitiveQuantity:(NSNumber*)value;

- (int16_t)primitiveQuantityValue;
- (void)setPrimitiveQuantityValue:(int16_t)value_;




- (NSNumber*)primitiveSyncStatus;
- (void)setPrimitiveSyncStatus:(NSNumber*)value;

- (int16_t)primitiveSyncStatusValue;
- (void)setPrimitiveSyncStatusValue:(int16_t)value_;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;





- (OrderHeader*)primitiveOrderNumber;
- (void)setPrimitiveOrderNumber:(OrderHeader*)value;


@end
