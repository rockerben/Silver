// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Birthday.m instead.

#import "_Birthday.h"

const struct BirthdayAttributes BirthdayAttributes = {
	.createdAt = @"createdAt",
	.date = @"date",
	.facebook = @"facebook",
	.giftIdeas = @"giftIdeas",
	.image = @"image",
	.name = @"name",
	.objectId = @"objectId",
	.syncStatus = @"syncStatus",
	.updatedAt = @"updatedAt",
};

const struct BirthdayRelationships BirthdayRelationships = {
};

const struct BirthdayFetchedProperties BirthdayFetchedProperties = {
};

@implementation BirthdayID
@end

@implementation _Birthday

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Birthday" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Birthday";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Birthday" inManagedObjectContext:moc_];
}

- (BirthdayID*)objectID {
	return (BirthdayID*)[super objectID];
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






@dynamic facebook;






@dynamic giftIdeas;






@dynamic image;






@dynamic name;






@dynamic objectId;






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











@end
