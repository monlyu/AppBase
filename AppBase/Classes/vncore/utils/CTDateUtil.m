//
//  VDateUtil.m
//  AppBase
//
//  Created by 显宏 黄 on 12-8-24.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import "CTDateUtil.h"

@implementation CTDateUtil
+(NSDate *)dateWithIntervalFrom1970:(NSTimeInterval)interl{
    return [NSDate dateWithTimeIntervalSince1970:interl];
}
+(NSTimeInterval)dateIntervalFrom1970:(NSDate *)date{
    return [date timeIntervalSince1970];
}
@end

@implementation NSString (VDateUtil)
-(NSDate *)format{
   return [self formatWith:@"yyyy-MM-dd"];
}
-(NSDate *)formatWith:(NSString*)format{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    timeFormatter.dateFormat = format;
    NSDate *adate = [timeFormatter dateFromString:self];
    [timeFormatter release];timeFormatter = nil;
    return adate;
}
@end

@implementation NSDate(VDateUtil)
-(NSString*)parse{
    return [self parse:@"yyyy-MM-dd"];
}
-(NSString*)parse:(NSString*)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *currentTime = [formatter stringFromDate:self];
    [formatter release]; formatter = nil;
    return currentTime;
}

-(BOOL)isSameToDate2:(NSDate *)date2 withFormate:(NSString *)format{
    if (format==nil) {
        return [self isEqualToDate:date2];
    }else{
        return [[self parse:format] isEqualToString:[date2 parse:format]];
    }
}
@end