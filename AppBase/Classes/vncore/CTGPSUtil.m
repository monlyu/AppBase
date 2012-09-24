//
//  BKGPSInvoker.m
//  Demo6
//
//  Created by BeikrMac on 12-9-24.
//  Copyright (c) 2012年 Beikr.inc. All rights reserved.
//

#import "CTGPSUtil.h"

@interface CTGPSUtil()
@property(assign,readwrite) BOOL locationHadFinished;
@property(retain,nonatomic) CLLocation *location;
@end

@implementation CTGPSUtil
@synthesize location;
@synthesize locationHadFinished;

- (id)init
{
    self = [super init];
    if (self) {
        locationMgr = [[CLLocationManager alloc] init];
        locationMgr.delegate = self;
        locationMgr.distanceFilter = 5.0;
        locationMgr.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        self.locationHadFinished = NO;
        [locationMgr startUpdatingLocation];
    }
    return self;
}

- (void)dealloc
{
    [location release],location=nil;
    [locationMgr release];locationMgr=nil;
    [super dealloc];
}

#define LAST_LOCATION @"lastLocation"

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation{
    if (IS_DEBUG_MODEL) {
        NSLog(@"定位结束->%@ %@",[NSDate date],newLocation);
    }
    self.location = newLocation;
    //store user last update location
    NSDictionary *store = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude],@"klat",
        [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude],@"klon", nil];
    [[NSUserDefaults standardUserDefaults] setValue:store forKey:LAST_LOCATION];
    
    [manager stopUpdatingLocation];
    self.locationHadFinished = YES;
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if (IS_DEBUG_MODEL) {
        NSLog(@"定位失败->%@ %@",[NSDate date],@"定位失败,获取上一次获取的值");
    }
    self.location = nil;
    [manager stopUpdatingLocation];
    self.locationHadFinished = YES;

    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_LOCATION];
    if (dict!=nil) {
        self.location = [[[CLLocation alloc]
                         initWithLatitude:[[dict objectForKey:@"klat"] floatValue]
                         longitude:[[dict objectForKey:@"klon"] floatValue]] autorelease];
    }
}


+(CLLocation *)curentLocation{
    //判断是否可用
    if (![CLLocationManager locationServicesEnabled]) {
        return [[CLLocation alloc] initWithLatitude:0 longitude:0];
    }
    
    CTGPSUtil *ink = [[[CTGPSUtil alloc] init] autorelease];
    while (!ink.locationHadFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    return ink.location;
}

@end


@implementation CLLocation (Extra)

-(float)latValue{
   return self.coordinate.latitude;
}
-(float)lonValue{
    return self.coordinate.longitude;
}

-(NSString *)latStringValue{
    return [NSString stringWithFormat:@"%f",[self latValue]];
}

-(NSString *)lonStringValue{
 return [NSString stringWithFormat:@"%f",[self lonValue]];
}

@end
