// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.h instead.

#import <CoreData/CoreData.h>


extern const struct AccountAttributes {
	__unsafe_unretained NSString *accountName;
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *objectId;
	__unsafe_unretained NSString *phone;
	__unsafe_unretained NSString *salesrep;
	__unsafe_unretained NSString *syncStatus;
	__unsafe_unretained NSString *updateAt;
	__unsafe_unretained NSString *website;
} AccountAttributes;

extern const struct AccountRelationships {
} AccountRelationships;

extern const struct AccountFetchedProperties {
} AccountFetchedProperties;













@interface AccountID : NSManagedObjectID {}
@end

@interface _Account : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AccountID*)objectID;





@property (nonatomic, strong) NSString* accountName;



//- (BOOL)validateAccountName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* address;



//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* image;



//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* objectId;



//- (BOOL)validateObjectId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* phone;



@property int16_t phoneValue;
- (int16_t)phoneValue;
- (void)setPhoneValue:(int16_t)value_;

//- (BOOL)validatePhone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* salesrep;



//- (BOOL)validateSalesrep:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* syncStatus;



@property int16_t syncStatusValue;
- (int16_t)syncStatusValue;
- (void)setSyncStatusValue:(int16_t)value_;

//- (BOOL)validateSyncStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updateAt;



//- (BOOL)validateUpdateAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* website;



//- (BOOL)validateWebsite:(id*)value_ error:(NSError**)error_;






@end

@interface _Account (CoreDataGeneratedAccessors)

@end

@interface _Account (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccountName;
- (void)setPrimitiveAccountName:(NSString*)value;




- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSData*)primitiveImage;
- (void)setPrimitiveImage:(NSData*)value;




- (NSString*)primitiveObjectId;
- (void)setPrimitiveObjectId:(NSString*)value;




- (NSNumber*)primitivePhone;
- (void)setPrimitivePhone:(NSNumber*)value;

- (int16_t)primitivePhoneValue;
- (void)setPrimitivePhoneValue:(int16_t)value_;




- (NSString*)primitiveSalesrep;
- (void)setPrimitiveSalesrep:(NSString*)value;




- (NSNumber*)primitiveSyncStatus;
- (void)setPrimitiveSyncStatus:(NSNumber*)value;

- (int16_t)primitiveSyncStatusValue;
- (void)setPrimitiveSyncStatusValue:(int16_t)value_;




- (NSDate*)primitiveUpdateAt;
- (void)setPrimitiveUpdateAt:(NSDate*)value;




- (NSString*)primitiveWebsite;
- (void)setPrimitiveWebsite:(NSString*)value;




@end
