//
//  APIInvoker.h
//  DemoImg
//
//  Created by 显宏 黄 on 12-8-30.
//  Copyright (c) 2012年  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTAPIInvoker : NSObject

@property(nonatomic,retain) id _target;
@property(nonatomic,assign) SEL _success;
@property(nonatomic,assign) SEL _fails;

/**
 *  接口调用处理方法
 *  
 *  api     (NSString)      > API的名字或者URL连接
 *  args    (NSDictionary)  > 参数信息
 *  target  (id)  > 参数信息
 *
 */
+(void)invokeApi:(NSString *)api args:(id)args target:(id)target succ:(SEL)succ error:(SEL)error;

@end
