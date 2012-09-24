//
//  BKGPSInvoker.h
//  Demo6
//
//  Created by BeikrMac on 12-9-24.
//  Copyright (c) 2012年 Beikr.inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#define IS_DEBUG_MODEL YES

@interface CTGPSUtil : NSObject<CLLocationManagerDelegate>{

    CLLocationManager *locationMgr;
    
}

+(CLLocation *)curentLocation;

@end


@interface CLLocation (Extra)

-(float)latValue;
-(float)lonValue;

-(NSString *)latStringValue;
-(NSString *)lonStringValue;


@end