//
//  VNets.m
//  AppBase
//
//  Created by 显宏 黄 on 12-8-21.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import "VNets.h"
#import "Reachability.h"

@implementation VNets
+ (BOOL) isEnableWIFI {
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}

// 是否3G
+ (BOOL) isEnable3G {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
}

@end
