//
//  PCFPushGeofenceLocationSpec.m
//  PCFPushSpecs
//
//  Created by DX181-XL on 2015-04-14.
//
//

#import "Kiwi.h"
#import "PCFPushGeofenceLocation.h"
#import "PCFPushErrors.h"
#import "PCFPushSpecsHelper.h"
#import "NSObject+PCFJSONizable.h"

SPEC_BEGIN(PCFPushGeofenceLocationSpec)

describe(@"PCFPushGeofenceLocation", ^{
    
    __block PCFPushGeofenceLocation *model;
    __block PCFPushSpecsHelper *helper;
    
    beforeEach(^{
        helper = [[PCFPushSpecsHelper alloc] init];
        [helper setupParameters];
    });
    
    afterEach(^{
        model = nil;
    });
    
    it(@"should be initializable", ^{
        model = [[PCFPushGeofenceLocation alloc] init];
        [[model shouldNot] beNil];
    });
   
    context(@"fields", ^{

        beforeEach(^{
            model = [[PCFPushGeofenceLocation alloc] init];
        });
        
        it(@"should start as nil", ^{
            [[theValue(model.id) should] beZero];
            [[model.name should] beNil];
            [[theValue(model.latitude) should] beZero];
            [[theValue(model.longitude) should] beZero];
            [[theValue(model.radius) should] beZero];
        });
        
        it(@"should have an ID", ^{
            model.id = TEST_GEOFENCE_ID;
            [[theValue(model.id) should] equal:theValue(TEST_GEOFENCE_ID)];
        });

        it(@"should have a name", ^{
            model.name = TEST_GEOFENCE_LOCATION_NAME;
            [[model.name should] equal:TEST_GEOFENCE_LOCATION_NAME];
        });

        it(@"should have a latitude", ^{
            model.latitude = TEST_GEOFENCE_LATITUDE;
            [[theValue(model.latitude) should] equal:theValue(TEST_GEOFENCE_LATITUDE)];
        });
        
        it(@"should have a longitude", ^{
            model.longitude = TEST_GEOFENCE_LONGITUDE;
            [[theValue(model.longitude) should] equal:theValue(TEST_GEOFENCE_LONGITUDE)];
        });
        
        it(@"should have a radius", ^{
            model.radius = TEST_GEOFENCE_RADIUS;
            [[theValue(model.radius) should] equal:theValue(TEST_GEOFENCE_RADIUS)];
        });
    });
    
    context(@"deserialization", ^{
        
        it(@"should handle a nil input", ^{
            NSError *error;
            model = [PCFPushGeofenceLocation pcfPushFromJSONData:nil error:&error];
            [[model should] beNil];
            [[error shouldNot] beNil];
            [[error.domain should] equal:PCFPushErrorDomain];
            [[theValue(error.code) should] equal:theValue(PCFPushBackEndDataUnparseable)];
        });
        
        it(@"should handle empty input", ^{
            NSError *error;
            model = [PCFPushGeofenceLocation pcfPushFromJSONData:[NSData data] error:&error];
            [[model should] beNil];
            [[error shouldNot] beNil];
            [[error.domain should] equal:PCFPushErrorDomain];
            [[theValue(error.code) should] equal:theValue(PCFPushBackEndDataUnparseable)];
        });
        
        it(@"should handle bad JSON", ^{
            NSError *error;
            NSData *JSONData = [@"I AM NOT JSON" dataUsingEncoding:NSUTF8StringEncoding];
            model = [PCFPushGeofenceLocation pcfPushFromJSONData:JSONData error:&error];
            [[model should] beNil];
            [[error shouldNot] beNil];
        });
        
        it(@"should construct a complete response object", ^{
            NSError *error;

            NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"geofence_location_1" ofType:@"json"];
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            
            [[data shouldNot] beNil];
            
            model = [PCFPushGeofenceLocation pcfPushFromJSONData:data error:&error];
            [[error should] beNil];
            [[theValue(model.id) should] equal:theValue(TEST_GEOFENCE_ID)];
            [[model.name should] equal:TEST_GEOFENCE_LOCATION_NAME];
            [[theValue(model.latitude) should] equal:theValue(TEST_GEOFENCE_LATITUDE)];
            [[theValue(model.longitude) should] equal:theValue(TEST_GEOFENCE_LONGITUDE)];
            [[theValue(model.radius) should] equal:theValue(TEST_GEOFENCE_RADIUS)];
        });
    });
    
    context(@"serialization", ^{
        
        __block NSDictionary *dict = nil;
        
        beforeEach(^{
            model = [[PCFPushGeofenceLocation alloc] init];
        });
        
        afterEach(^{
            dict = nil;
        });
        
        context(@"populated object", ^{
            
            beforeEach(^{
                model.id = TEST_GEOFENCE_ID;
                model.name = TEST_GEOFENCE_LOCATION_NAME;
                model.latitude = TEST_GEOFENCE_LATITUDE;
                model.longitude = TEST_GEOFENCE_LONGITUDE;
                model.radius = TEST_GEOFENCE_RADIUS;
            });
            
            afterEach(^{
                [[dict shouldNot] beNil];
                [[dict[@"id"] should] equal:theValue(TEST_GEOFENCE_ID)];
                [[dict[@"name"] should] equal:TEST_GEOFENCE_LOCATION_NAME];
                [[dict[@"lat"] should] equal:theValue(TEST_GEOFENCE_LATITUDE)];
                [[dict[@"long"] should] equal:theValue(TEST_GEOFENCE_LONGITUDE)];
                [[dict[@"rad"] should] equal:theValue(TEST_GEOFENCE_RADIUS)];
            });
            
            it(@"should be dictionaryizable", ^{
                dict = [model pcfPushToFoundationType];
            });
            
            it(@"should be JSONizable", ^{
                NSData *JSONData = [model pcfPushToJSONData:nil];
                [[JSONData shouldNot] beNil];
                NSError *error = nil;
                dict = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&error];
                [[error should] beNil];
            });
        });
        
        context(@"unpopulated object", ^{
            
            afterEach(^{
                [[dict shouldNot] beNil];
                [[dict[@"id"] should] beZero];
                [[dict[@"name"] should] beNil];
                [[dict[@"lat"] should] beZero];
                [[dict[@"long"] should] beZero];
                [[dict[@"rad"] should] beZero];
            });
            
            it(@"should be dictionaryizable", ^{
                dict = [model pcfPushToFoundationType];
            });
            
            it(@"should be JSONizable", ^{
                NSData *JSONData = [model pcfPushToJSONData:nil];
                [[JSONData shouldNot] beNil];
                NSError *error = nil;
                dict = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&error];
                [[error should] beNil];
            });
        });
    });

    context(@"object comparison", ^{

        it(@"should be able to compare to objects with isEqual", ^{

            PCFPushGeofenceLocation *location1 = [[PCFPushGeofenceLocation alloc] init];
            location1.id = 55;
            location1.name = [@"CHURROS " stringByAppendingString:@"LOCATION"];
            location1.latitude = 80.5;
            location1.longitude = -40.5;
            location1.radius = 160.5;

            PCFPushGeofenceLocation *location2 = [[PCFPushGeofenceLocation alloc] init];
            location2.id = 55;
            location2.name = [NSString stringWithFormat:@"%@ LOC%@", @"CHURROS", @"ATION"];
            location2.latitude = 80.5;
            location2.longitude = -40.5;
            location2.radius = 160.5;

            [[theValue([location1 isEqual:location2]) should] beYes];
            [[theValue([location2 isEqual:location1]) should] beYes];

            [[location1 should] equal:location2];
            [[location2 should] equal:location1];
        });
    });
});

SPEC_END
