//
//  NewsViewController.m
//  LukeMovie
//
//  Created by Luke Lu on 13-8-9.
//  Copyright (c) 2013年 www.lukelu.org. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"News";
    }
    return self;
}

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - Memory Manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if (self.view.window == nil) {
        //...[_testView release], _testView = nil;
        self.view = nil;
    }// 将视图控制器中的强引用释放
}

@end
