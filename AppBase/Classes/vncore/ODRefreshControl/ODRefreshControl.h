//
//  ODRefreshControl.h
//  ODRefreshControl
//
//  Created by Fabio Ritrovato on 6/13/12.
//  Copyright (c) 2012 orange in a day. All rights reserved.
//
// https://github.com/Sephiroth87/ODRefreshControl
//
/**
	How to Use
	ODRefreshControl *refreshControl = [[ODRefreshControl alloc] initInScrollView:self.tableView];
    [refreshControl addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];

    -----------------------------
	- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
	{
	    //开始刷新
	    double delayInSeconds = 3.0;
	    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
	    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
	        [refreshControl endRefreshing];
	    });
	}
*/

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ODRefreshControl : UIControl {
    CAShapeLayer *_shapeLayer;
    CAShapeLayer *_arrowLayer;
    CAShapeLayer *_highlightLayer;
    UIActivityIndicatorView *_activity;
    BOOL _refreshing;
    BOOL _canRefresh;
}

@property (nonatomic, readonly) BOOL refreshing;
@property (nonatomic, strong) UIColor *tintColor;

- (id)initInScrollView:(UIScrollView *)scrollView;

// Tells the control that a refresh operation was started programmatically
- (void)beginRefreshing;

// Tells the control the refresh operation has ended
- (void)endRefreshing;

@end
