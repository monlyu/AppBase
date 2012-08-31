//
//  BKEGOImage.m
//  DemoImg
//
//  Created by 显宏 黄 on 12-8-30.
//  Copyright (c) 2012年 beikr.com. All rights reserved.
//

#import "CIEGOImageView.h"

@implementation CIEGOImageView
- (id)initWithFrame:(CGRect)frame placeImg:(NSString *)placeImg url:(NSString *)imgUrl{
    self = [super initWithFrame:frame];
    if (self) {
        imageLoaded = NO;
        self.delegate = self;
        self.placeholderImage = [UIImage imageNamed:placeImg];
        self.imageURL = [NSURL URLWithString:imgUrl];
        activi = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        activi.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [self addSubview:activi];
        [activi startAnimating];
        if (imageLoaded) {
            [activi stopAnimating];
            [activi setHidden:YES];
        }
    }
    return self;
}

- (void)dealloc {
    [activi release],activi=nil;
    [super dealloc];
}

- (void)imageViewLoadedImage:(EGOImageView*)imageView{
    [activi setHidden:YES];
    [activi removeFromSuperview];
    imageLoaded = YES;
}

- (void)imageViewFailedToLoadImage:(EGOImageView*)imageView error:(NSError*)error{
    [activi setHidden:YES];
    [activi removeFromSuperview];
}

@end
