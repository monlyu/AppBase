//
//  VDateUtil.h
//  AppBase
//
//  Created by 显宏 黄 on 12-8-24.
//  Copyright (c) 2012年  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTDateUtil : NSObject
+(NSDate *)dateWithIntervalFrom1970:(NSTimeInterval)interl;
+(NSTimeInterval)dateIntervalFrom1970:(NSDate *)date;
@end

//扩展字符串
@interface NSString (CTDateUtil)
-(NSDate *)format;
-(NSDate *)formatWith:(NSString*)format;
@end

//扩展日期函数信息

@interface NSDate(CTDateUtil)
-(NSString*)parse;
-(NSString*)parse:(NSString*)format;
-(BOOL)isSameToDate2:(NSDate *)date2 withFormate:(NSString *)format;
@end