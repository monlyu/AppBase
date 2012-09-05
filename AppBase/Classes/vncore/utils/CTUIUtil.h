//
//  VUIUtil.h
//  AppBase
//
//  Created by 显宏 黄 on 12-8-24.
//  Copyright (c) 2012年  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTUIUtil : NSObject

+(UIColor *)color:(float)red blue:(float)blue green:(float)green alpha:(float)alpha;
+(UIColor *)color:(NSString *)hex alpha:(float)alpha;
+(UIColor *)color:(NSString *)hex;

@end

/**
 这个是扩展对应的字符串的颜色控制
*/
@interface NSString (VUIUtil)
-(UIColor *)hexColor;
@end

