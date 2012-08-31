//
//  APIInvoker.m
//  DemoImg
//
//  Created by 显宏 黄 on 12-8-30.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import "CTAPIInvoker.h"

@interface CTAPIInvoker(Private)
-(void)submitForm:(NSString *)apiName andArgs:(NSDictionary *)args;
-(void)submitFormSuccess:(NSDictionary *)backinfo;
-(void)submitFormFails:(NSDictionary *)backinfo;
@end

@implementation CTAPIInvoker
@synthesize _target,_success,_fails;

//提交API接口
+(void)invokeApi:(NSString *)api args:(id)args target:(id)target succ:(SEL)succ error:(SEL)error{
    CTAPIInvoker *voker = [[[CTAPIInvoker alloc] init] autorelease];
    voker._target = target;
    voker._success = succ;
    voker._fails = error;
    [voker performSelectorInBackground:@selector(submitForm:andArgs:) withObject:args];
}
- (void)dealloc {
    [_target release],_target=nil;
    [super dealloc];
}
//提交表单
-(void)submitForm:(NSString *)apiName andArgs:(NSDictionary *)args{
    id bakcInfo = [NSDictionary dictionaryWithObject:[NSDate date] forKey:@"Time:"];
    if (YES) {
        [self performSelectorOnMainThread:@selector(submitFormSuccess:) withObject:bakcInfo waitUntilDone:NO];
    }else{
        [self performSelectorOnMainThread:@selector(submitFormFails:) withObject:bakcInfo waitUntilDone:NO];
    }
}
//提交表单成功
-(void)submitFormSuccess:(NSDictionary *)backinfo{
    [_target performSelector:_success withObject:backinfo];
}
//提交表单失败处理
-(void)submitFormFails:(NSDictionary *)backinfo{
    [_target performSelector:_fails withObject:backinfo];
}

@end
