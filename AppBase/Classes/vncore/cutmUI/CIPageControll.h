//
//  BKPageControll.h
//  BKEssential
//
//  Created by 显宏 黄 on 12-8-22.
//  Copyright (c) 2012年  All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIPageControll : UIPageControl
{
    UIImage *imageStatusNormal;
    UIImage *imageStatusHighlight;
    
}

@property (nonatomic, retain) UIImage *imageStatusNormal;
@property (nonatomic, retain) UIImage *imageStatusHighlight;
-(void)updateDots;
@end
