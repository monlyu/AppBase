//
//  BKEGOImage.h
//  DemoImg
//
//  Created by 显宏 黄 on 12-8-30.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGOImageView.h"

@interface CIEGOImageView : EGOImageView<EGOImageViewDelegate>{

    UIActivityIndicatorView *activi;
    
    BOOL imageLoaded;
}

- (id)initWithFrame:(CGRect)frame placeImg:(NSString *)placeImg url:(NSString *)imgUrl;

@end
