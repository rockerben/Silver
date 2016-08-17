// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderHeader.m instead.

#import "_OrderHeader.h"

const struct OrderHeaderAttributes OrderHeaderAttributes = {
	.accountName = @"accountName",
	.createdAt = @"createdAt",
	.date = @"date",
	.image = @"image",
	.objectId = @"objectId",
	.observedBy = @"observedBy",
	.orderDesc = @"orderDesc",
	.syncStatus = @"syncStatus",
	.updatedAt = @"updatedAt",
};

const struct OrderHeaderRelationships OrderHeaderRelationships = {
	.orderNumber = @"orderNumber",
};

const struct OrderHeaderFetchedProperties OrderHeaderFetchedProperties = {
};

@implementation OrderHeaderID
@end

@implementation _OrderHeader

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OrderHeader" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OrderHeader";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OrderHeader" inManagedObjectContext:moc_];
}

- (OrderHeaderID*)objectID {
	return (OrderHeaderID*)[super objectID];
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




@dynamic accountName;






@dynamic createdAt;






@dynamic date;






@dynamic image;






@dynamic objectId;






@dynamic observedBy;






@dynamic orderDesc;






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






@dynamic orderNumber;

	






@end
