//
//  BaseNavigationController.m
//  LukeMovie
//
//  Created by Luke Lu on 13-8-14.
//  Copyright (c) 2013年 www.lukelu.org. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // after iOS 5.0
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all.png"] forBarMetrics:UIBarMetricsDefault];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
