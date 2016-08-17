// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderDetail.m instead.

#import "_OrderDetail.h"

const struct OrderDetailAttributes OrderDetailAttributes = {
	.createdAt = @"createdAt",
	.date = @"date",
	.itemName = @"itemName",
	.objectId = @"objectId",
	.quantity = @"quantity",
	.syncStatus = @"syncStatus",
	.updatedAt = @"updatedAt",
};

const struct OrderDetailRelationships OrderDetailRelationships = {
	.orderNumber = @"orderNumber",
};

const struct OrderDetailFetchedProperties OrderDetailFetchedProperties = {
};

@implementation OrderDetailID
@end

@implementation _OrderDetail

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OrderDetail" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OrderDetail";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OrderDetail" inManagedObjectContext:moc_];
}

- (OrderDetailID*)objectID {
	return (OrderDetailID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"quantityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"quantity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"syncStatusValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"syncStatus"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdAt;






@dynamic date;






@dynamic itemName;






@dynamic objectId;






@dynamic quantity;



- (int16_t)quantityValue {
	NSNumber *result = [self quantity];
	return [result shortValue];
}

- (void)setQuantityValue:(int16_t)value_ {
	[self setQuantity:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveQuantityValue {
	NSNumber *result = [self primitiveQuantity];
	return [result shortValue];
}

- (void)setPrimitiveQuantityValue:(int16_t)value_ {
	[self setPrimitiveQuantity:[NSNumber numberWithShort:value_]];
}





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
