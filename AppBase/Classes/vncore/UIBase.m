//
//  UIBase.m
//  AppBase
//
//  Created by 显宏 黄 on 12-8-24.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import "UIBase.h"

@implementation UIBase

-(void)showMessge:(NSString *)msg{
    [CINotificationView showNoticeInView:self.view type:CINotificationTypeBlue title:msg hideAfter:1];
}

-(void)showErrorMessage:(NSString *)error{
    [CINotificationView showNoticeInView:self.view type:CINotificationTypeOrange title:error hideAfter:1];
}

-(void)showWaringMessage:(NSString *)warning{
    [CINotificationView showNoticeInView:self.view type:CINotificationTypeRed title:warning hideAfter:1];
}
@end
