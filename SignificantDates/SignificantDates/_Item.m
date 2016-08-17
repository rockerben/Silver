// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.m instead.

#import "_Item.h"

const struct ItemAttributes ItemAttributes = {
	.availability = @"availability",
	.ean = @"ean",
	.itemDescription = @"itemDescription",
	.itemName = @"itemName",
};

const struct ItemRelationships ItemRelationships = {
};

const struct ItemFetchedProperties ItemFetchedProperties = {
};

@implementation ItemID
@end

@implementation _Item

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Item";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Item" inManagedObjectContext:moc_];
}

- (ItemID*)objectID {
	return (ItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"availabilityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"availability"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"eanValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"ean"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic availability;



- (BOOL)availabilityValue {
	NSNumber *result = [self availability];
	return [result boolValue];
}

- (void)setAvailabilityValue:(BOOL)value_ {
	[self setAvailability:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveAvailabilityValue {
	NSNumber *result = [self primitiveAvailability];
	return [result boolValue];
}

- (void)setPrimitiveAvailabilityValue:(BOOL)value_ {
	[self setPrimitiveAvailability:[NSNumber numberWithBool:value_]];
}





@dynamic ean;



- (int16_t)eanValue {
	NSNumber *result = [self ean];
	return [result shortValue];
}

- (void)setEanValue:(int16_t)value_ {
	[self setEan:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveEanValue {
	NSNumber *result = [self primitiveEan];
	return [result shortValue];
}

- (void)setPrimitiveEanValue:(int16_t)value_ {
	[self setPrimitiveEan:[NSNumber numberWithShort:value_]];
}





@dynamic itemDescription;






@dynamic itemName;











@end
