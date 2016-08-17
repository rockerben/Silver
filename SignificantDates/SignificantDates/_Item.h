// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.h instead.

#import <CoreData/CoreData.h>


extern const struct ItemAttributes {
	__unsafe_unretained NSString *availability;
	__unsafe_unretained NSString *ean;
	__unsafe_unretained NSString *itemDescription;
	__unsafe_unretained NSString *itemName;
} ItemAttributes;

extern const struct ItemRelationships {
} ItemRelationships;

extern const struct ItemFetchedProperties {
} ItemFetchedProperties;







@interface ItemID : NSManagedObjectID {}
@end

@interface _Item : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ItemID*)objectID;





@property (nonatomic, strong) NSNumber* availability;



@property BOOL availabilityValue;
- (BOOL)availabilityValue;
- (void)setAvailabilityValue:(BOOL)value_;

//- (BOOL)validateAvailability:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* ean;



@property int16_t eanValue;
- (int16_t)eanValue;
- (void)setEanValue:(int16_t)value_;

//- (BOOL)validateEan:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* itemDescription;



//- (BOOL)validateItemDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* itemName;



//- (BOOL)validateItemName:(id*)value_ error:(NSError**)error_;






@end

@interface _Item (CoreDataGeneratedAccessors)

@end

@interface _Item (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAvailability;
- (void)setPrimitiveAvailability:(NSNumber*)value;

- (BOOL)primitiveAvailabilityValue;
- (void)setPrimitiveAvailabilityValue:(BOOL)value_;




- (NSNumber*)primitiveEan;
- (void)setPrimitiveEan:(NSNumber*)value;

- (int16_t)primitiveEanValue;
- (void)setPrimitiveEanValue:(int16_t)value_;




- (NSString*)primitiveItemDescription;
- (void)setPrimitiveItemDescription:(NSString*)value;




- (NSString*)primitiveItemName;
- (void)setPrimitiveItemName:(NSString*)value;




@end
