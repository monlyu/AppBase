//
//  UIBtnList.h
//  AppBase
//
//  Created by 显宏 黄 on 12-8-24.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VUtils.h"

@protocol CIBtnListClickDelegate <NSObject>
-(void)listBtnClickWithButton:(UIButton *)button index:(NSNumber*)index;
@end

@interface CIBtnList : UIView{
    NSArray *array;
    int currentSelected;
    UIImageView *selectedImageView;
}

@property(nonatomic,retain) id<CIBtnListClickDelegate> delegate;
-(id)initWithFrame:(CGRect)frame andArray:(NSArray *)array;
-(void)setBtnSelectedAtIndex:(NSNumber *)index;
@end
