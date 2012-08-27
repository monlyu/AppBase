//
//  UIBtnList.m
//  AppBase
//
//  Created by 显宏 黄 on 12-8-24.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import "CIBtnList.h"

@interface CIBtnList(Private)
-(void)buttonClick:(UIButton *)sender;
@end

@implementation CIBtnList
@synthesize delegate;

#define TagStart 15313

-(id)initWithFrame:(CGRect)frame andArray:(NSArray *)_array{
    self = [super initWithFrame:frame];
    if (self) {
        array = [_array retain];
        currentSelected = 0;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bottom_bar_select_bg.png"]];
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, 160, 29);
        int offx = 0;
        int loop = 0;
        selectedImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        selectedImageView.image = [UIImage imageNamed:@"bottom_bar_select_bt.png"];
        [self addSubview:selectedImageView];
        for (NSString *title in array) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(offx, 1, 51, 27);
            [button setTitle:title forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = TagStart+loop;
            [button setTitleColor:[@"ececec" hexColor] forState:UIControlStateNormal];
            [button setTitleColor:[@"000000" hexColor] forState:UIControlStateSelected];
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
            [self addSubview:button];
            offx+=51+3;
            loop++;
        }
        [self setBtnSelectedAtIndex:[NSNumber numberWithInt:currentSelected]];
    }
    return self;
}
-(void)setBtnSelectedAtIndex:(NSNumber *)index{
    for (int i=0; i<[array count]; i++) {
        UIButton *b = (UIButton *)[self viewWithTag:TagStart+i];
        [b setSelected:NO];
    }
    [UIView beginAnimations:@"move mark" context:nil];
    UIButton *btn = (UIButton *)[self viewWithTag:TagStart+[index intValue]];
    [btn setSelected:YES];
    selectedImageView.frame = btn.frame;
    [UIView commitAnimations];
}
-(void)buttonClick:(UIButton *)sender{
    currentSelected = sender.tag-TagStart;
    [self setBtnSelectedAtIndex:[NSNumber numberWithInt:currentSelected]];
    if (delegate && [delegate respondsToSelector:@selector(listbuttonClick:index:)]) {
        [delegate performSelector:@selector(listbuttonClick:index:) withObject:sender withObject:[NSNumber numberWithInt:currentSelected]];
    }
}
- (void)dealloc {
    [selectedImageView release];
    [array release],array=nil;
    [super dealloc];
}

@end


