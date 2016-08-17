// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Birthday.h instead.

#import <CoreData/CoreData.h>


extern const struct BirthdayAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *facebook;
	__unsafe_unretained NSString *giftIdeas;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *objectId;
	__unsafe_unretained NSString *syncStatus;
	__unsafe_unretained NSString *updatedAt;
} BirthdayAttributes;

extern const struct BirthdayRelationships {
} BirthdayRelationships;

extern const struct BirthdayFetchedProperties {
} BirthdayFetchedProperties;












@interface BirthdayID : NSManagedObjectID {}
@end

@interface _Birthday : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BirthdayID*)objectID;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* facebook;



//- (BOOL)validateFacebook:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* giftIdeas;



//- (BOOL)validateGiftIdeas:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* image;



//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* objectId;



//- (BOOL)validateObjectId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* syncStatus;



@property int16_t syncStatusValue;
- (int16_t)syncStatusValue;
- (void)setSyncStatusValue:(int16_t)value_;

//- (BOOL)validateSyncStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;






@end

@interface _Birthday (CoreDataGeneratedAccessors)

@end

@interface _Birthday (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveFacebook;
- (void)setPrimitiveFacebook:(NSString*)value;




- (NSString*)primitiveGiftIdeas;
- (void)setPrimitiveGiftIdeas:(NSString*)value;




- (NSData*)primitiveImage;
- (void)setPrimitiveImage:(NSData*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveObjectId;
- (void)setPrimitiveObjectId:(NSString*)value;




- (NSNumber*)primitiveSyncStatus;
- (void)setPrimitiveSyncStatus:(NSNumber*)value;

- (int16_t)primitiveSyncStatusValue;
- (void)setPrimitiveSyncStatusValue:(int16_t)value_;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;




@end
