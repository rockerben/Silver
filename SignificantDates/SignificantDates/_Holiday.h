// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Holiday.h instead.

#import <CoreData/CoreData.h>


extern const struct HolidayAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *details;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *objectId;
	__unsafe_unretained NSString *observedBy;
	__unsafe_unretained NSString *syncStatus;
	__unsafe_unretained NSString *updatedAt;
	__unsafe_unretained NSString *wikipediaLink;
} HolidayAttributes;

extern const struct HolidayRelationships {
} HolidayRelationships;

extern const struct HolidayFetchedProperties {
} HolidayFetchedProperties;








@class NSObject;




@interface HolidayID : NSManagedObjectID {}
@end

@interface _Holiday : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (HolidayID*)objectID;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* details;



//- (BOOL)validateDetails:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* image;



//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* objectId;



//- (BOOL)validateObjectId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) id observedBy;



//- (BOOL)validateObservedBy:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* syncStatus;



@property int16_t syncStatusValue;
- (int16_t)syncStatusValue;
- (void)setSyncStatusValue:(int16_t)value_;

//- (BOOL)validateSyncStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* wikipediaLink;



//- (BOOL)validateWikipediaLink:(id*)value_ error:(NSError**)error_;






@end

@interface _Holiday (CoreDataGeneratedAccessors)

@end

@interface _Holiday (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveDetails;
- (void)setPrimitiveDetails:(NSString*)value;




- (NSData*)primitiveImage;
- (void)setPrimitiveImage:(NSData*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveObjectId;
- (void)setPrimitiveObjectId:(NSString*)value;




- (id)primitiveObservedBy;
- (void)setPrimitiveObservedBy:(id)value;




- (NSNumber*)primitiveSyncStatus;
- (void)setPrimitiveSyncStatus:(NSNumber*)value;

- (int16_t)primitiveSyncStatusValue;
- (void)setPrimitiveSyncStatusValue:(int16_t)value_;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;




- (NSString*)primitiveWikipediaLink;
- (void)setPrimitiveWikipediaLink:(NSString*)value;




@end
