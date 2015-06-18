//
// Created by DX181-XL on 15-04-17.
// Copyright (c) 2015 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCFPushGeofenceData;
@class PCFPushGeofenceLocation;
@class PCFPushGeofenceDataList;
@class CLLocation;

@interface PCFPushGeofenceLocationMap : NSObject

+ (instancetype) map;
+ (instancetype) mapWithGeofencesInList:(PCFPushGeofenceDataList *)list;

- (NSUInteger) count;
- (id)objectForKeyedSubscript:(id <NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;
- (void) put:(PCFPushGeofenceData*)geofence location:(PCFPushGeofenceLocation*)location;
- (void) put:(PCFPushGeofenceData*)geofence locationIndex:(NSUInteger)locationIndex;
- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(NSString *requestId, PCFPushGeofenceLocation *location, BOOL *stop))block;
- (BOOL)isEqual:(id)anObject;
- (NSArray*)sortKeysByDistanceToLocation:(CLLocation*)deviceLocation;

@end