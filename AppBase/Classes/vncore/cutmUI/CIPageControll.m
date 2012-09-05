//
//  BKPageControll.m
//  BKEssential
//
//  Created by 显宏 黄 on 12-8-22.
//  Copyright (c) 2012年  All rights reserved.
//

#import "CIPageControll.h"

@interface CIPageControll(private)

@end

@implementation CIPageControll

@synthesize imageStatusNormal,imageStatusHighlight;

-(void)layoutSubviews{
    if (self) {
        [super layoutSubviews];
        self.backgroundColor = [UIColor clearColor];
        self.imageStatusNormal = [UIImage imageNamed:@"dot2.png"];
        self.imageStatusHighlight = [UIImage imageNamed:@"dot1.png"];
        [self updateDots];
    }
}
- (void)setImagePageStateNormal:(UIImage *)image {  // 设置正常状态点按钮的图片
    [imageStatusNormal release];
    imageStatusNormal = [image retain];
    [self updateDots];
}
- (void)setImagePageStateHighlighted:(UIImage *)image { // 设置高亮状态点按钮图片
    [imageStatusHighlight release];
    imageStatusHighlight = [image retain];
    [self updateDots];
}
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event { // 点击事件
    [super endTrackingWithTouch:touch withEvent:event];
    [self updateDots];
}
- (void)updateDots { // 更新显示所有的点按钮
    if (imageStatusNormal  || imageStatusHighlight)
    {
        int offSetX = 0;
        NSArray *subview = self.subviews;  // 获取所有子视图
        for (NSInteger i = 0; i < [subview count]; i++)
        {
            UIImageView *dot = [subview objectAtIndex:i];  // 以下不解释, 看了基本明白
            dot.image = self.currentPage == i ? imageStatusNormal : imageStatusHighlight;
            CGRect fr =  dot.frame;
            dot.frame = CGRectMake(offSetX,fr.origin.y, fr.size.width, fr.size.height);
            offSetX+=fr.size.width+5;
        }
    }
    self.frame = CGRectMake(8, self.frame.origin.y,self.frame.size.width, self.frame.size.height);
}
- (void)dealloc { // 释放内存
    [imageStatusNormal release], imageStatusNormal = nil;
    [imageStatusHighlight release], imageStatusHighlight = nil;
    [super dealloc];
}

@end
