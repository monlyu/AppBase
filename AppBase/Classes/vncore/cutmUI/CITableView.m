//
//  CITableView.m
//  AppBase
//
//  Created by 显宏 黄 on 12-9-5.
//  Copyright (c) 2012年  All rights reserved.
//

#import "CITableView.h"

@interface CITableView(Private)
-(void)startPullDownRefresh:(ODRefreshControl *)control;
@end

@implementation CITableView
@synthesize tconfig;

-(id)initWithFrame:(CGRect)frame andDelegate:(id<CITableDelegate>)config{
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    if (self) {
        self.tconfig = config;
        odRefreshControl = [[ODRefreshControl alloc] initInScrollView:self];
        [odRefreshControl addTarget:self action:@selector(startPullDownRefresh:) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

-(void)startPullDownRefresh:(ODRefreshControl *)control{
    if(tconfig && [tconfig respondsToSelector:@selector(refreshToLatest:control:)]){
        [tconfig performSelector:@selector(refreshToLatest:control:) withObject:self withObject:control];
    }
}

- (void)dealloc {
    [odRefreshControl release],odRefreshControl=nil;
    [tconfig release];tconfig=nil;
    [super dealloc];
}

@end
