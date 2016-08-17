// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Holiday.m instead.

#import "_Holiday.h"

const struct HolidayAttributes HolidayAttributes = {
	.createdAt = @"createdAt",
	.date = @"date",
	.details = @"details",
	.image = @"image",
	.name = @"name",
	.objectId = @"objectId",
	.observedBy = @"observedBy",
	.syncStatus = @"syncStatus",
	.updatedAt = @"updatedAt",
	.wikipediaLink = @"wikipediaLink",
};

const struct HolidayRelationships HolidayRelationships = {
};

const struct HolidayFetchedProperties HolidayFetchedProperties = {
};

@implementation HolidayID
@end

@implementation _Holiday

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Holiday" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Holiday";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Holiday" inManagedObjectContext:moc_];
}

- (HolidayID*)objectID {
	return (HolidayID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"syncStatusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"syncStatus"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdAt;






@dynamic date;






@dynamic details;






@dynamic image;






@dynamic name;






@dynamic objectId;






@dynamic observedBy;






@dynamic syncStatus;



- (int16_t)syncStatusValue {
	NSNumber *result = [self syncStatus];
	return [result shortValue];
}

- (void)setSyncStatusValue:(int16_t)value_ {
	[self setSyncStatus:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveSyncStatusValue {
	NSNumber *result = [self primitiveSyncStatus];
	return [result shortValue];
}

- (void)setPrimitiveSyncStatusValue:(int16_t)value_ {
	[self setPrimitiveSyncStatus:[NSNumber numberWithShort:value_]];
}





@dynamic updatedAt;






@dynamic wikipediaLink;











@end
