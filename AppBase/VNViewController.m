//
//  VNViewController.m
//  AppBase
//
//  Created by 显宏 黄 on 12-8-21.
//  Copyright (c) 2012年  All rights reserved.
//

#import "VNViewController.h"

@implementation VNViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    CITableView *ta = [[CITableView alloc] initWithFrame:CGRectMake(10 , 0, 320, 200) andDelegate:self];
    ta.delegate = self;
    ta.dataSource = self;
    [self.view addSubview:ta];
    
}

-(void)refreshToLatest:(CITableView*)table control:(ODRefreshControl*)control{
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [control endRefreshing];
    }); 
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *idf = @"sss";
    UITableViewCell *cel = [tableView dequeueReusableCellWithIdentifier:idf];
    if (cel==nil) {
        cel = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idf] autorelease];
    }
    cel.textLabel.text = [[NSDate date] parse:@"yyyy-MM-dd HH:mm:ss"];

    return cel;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
