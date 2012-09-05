//
//  UIBase.h
//  AppBase
//
//  Created by 显宏 黄 on 12-8-24.
//  Copyright (c) 2012年  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conifig.h"
#import "CINotificationView.h"
#import "EGOImageView.h"
#import "MGJSON.h"
#import "Utils.h"

@interface UIBase : UIViewController

-(void)showMessge:(NSString *)msg;
-(void)showErrorMessage:(NSString *)error;
-(void)showWaringMessage:(NSString *)warning;

@end
