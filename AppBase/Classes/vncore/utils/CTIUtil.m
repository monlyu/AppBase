//
//  VUIUtil.m
//  AppBase
//
//  Created by 显宏 黄 on 12-8-24.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import "CTUIUtil.h"

@implementation CTUIUtil

+(UIColor *)color:(float)red blue:(float)blue green:(float)green alpha:(float)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+(UIColor *)color:(NSString *)hex alpha:(float)alpha{
    if ([hex characterAtIndex:0]=='#') {
        hex = [hex substringFromIndex:1];
    }
    NSString *rs = [hex substringWithRange:NSMakeRange(0, 2)];
    long r = strtol([rs UTF8String],NULL, 16);
    NSString *gs = [hex substringWithRange:NSMakeRange(2, 2)];
    long g = strtol([gs UTF8String],NULL, 16);
    NSString *bs = [hex substringWithRange:NSMakeRange(4, 2)];
    long b = strtol([bs UTF8String],NULL, 16);
    return [CTUIUtil color:r blue:b green:g alpha:alpha];
}

/**
    十六进制转化为颜色
 */
+(UIColor *)color:(NSString *)hex{
    return [CTUIUtil color:hex alpha:1.0];
}

@end

@implementation NSString (VUIUtil)
-(UIColor*)hexColor{
    return [CTUIUtil color:self];
}
@end
