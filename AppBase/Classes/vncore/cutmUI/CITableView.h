//
//  CITableView.h
//  AppBase
//
//  Created by 显宏 黄 on 12-9-5.
//  Copyright (c) 2012年  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ODRefreshControl.h"
@protocol CITableDelegate;

@interface CITableView : UITableView<UITableViewDelegate>{
    ODRefreshControl *odRefreshControl;
}

@property(nonatomic,retain) id<CITableDelegate> tconfig;

//配置信息
-(id)initWithFrame:(CGRect)frame andDelegate:(id<CITableDelegate>)config;

@end

@protocol CITableDelegate <NSObject>

-(void)refreshToLatest:(CITableView*)table control:(ODRefreshControl*)control;

@end