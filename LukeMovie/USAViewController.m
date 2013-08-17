//
//  USAViewController.m
//  LukeMovie
//
//  Created by Luke Lu on 13-8-9.
//  Copyright (c) 2013年 www.lukelu.org. All rights reserved.
//

#import "USAViewController.h"
#import "LLNetworkService.h"

#define kListItemViewTag 101
#define kPosterItemViewTag 102

@interface USAViewController ()

// 加载listView
- (void)loadListView;

// 加载posterView
- (void)loadPosterView;

// 加载NavigationItem
- (void)loadNavigationItem;

// 过渡动画效果
- (void)animationView:(UIView *)view withFlag:(BOOL)flag;
@end

@implementation USAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"North America";
    }
    return self;
}

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadListView];
    [self loadPosterView];
    [self loadNavigationItem];

    id result = [LLNetworkService northUSAData];
    NSLog(@"USAData:%@", [[result objectAtIndex:0] objectForKey:@"box"]);
    NSLog(@"USAData:%@", [[result objectAtIndex:0] objectForKey:@"new"]);
}

// 加载listView
- (void)loadListView
{
    _listView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-20-44-49) style:UITableViewStylePlain];
    [self.view addSubview:_listView];
}

// 加载posterView
- (void)loadPosterView
{
    _posterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-20-40-49)];
    _posterView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_posterView];
}

// 加载NavigationItem
- (void)loadNavigationItem
{
    // create barButtonItem view
    UIImageView *barButtonItem = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 44, 25)];
    barButtonItem.userInteractionEnabled = YES;
    barButtonItem.image = [UIImage imageNamed:@"exchange_bg_home"];

    // add gesture recognizer for barButtonItem view
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeBrowseMode)];
    [barButtonItem addGestureRecognizer:tap];
    [tap release];

    // post item view
    UIImageView *posterItem = [[UIImageView alloc] initWithFrame:CGRectMake(barButtonItem.width/2.0 - 22.0/2, barButtonItem.height/2.0 - 15/2.0, 22, 15)];
    posterItem.image = [UIImage imageNamed:@"poster_home"];
    posterItem.tag = kPosterItemViewTag;
    posterItem.hidden = YES;
    
    // list item view
    UIImageView *listItem = [[UIImageView alloc] initWithFrame:CGRectMake(barButtonItem.width/2.0 - 23.0/2, barButtonItem.height/2.0 - 7, 23, 14)];
    listItem.image = [UIImage imageNamed:@"list_home"];
    listItem.tag = kListItemViewTag;
    
    [barButtonItem addSubview:listItem];
    [barButtonItem addSubview:posterItem];
    [listItem release];
    [posterItem release];

    // add barButtonItem to rightBarButtonItem of navigationItem
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:barButtonItem];
    [barButtonItem release];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
}

- (void)animationView:(UIView *)view withFlag:(BOOL)flag
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView setAnimationTransition: flag ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight forView:view cache:YES];
    [UIView commitAnimations];
}

#pragma mark - Target Actions
- (void)changeBrowseMode
{
    UIView *barButtonItem = [self.navigationItem.rightBarButtonItem customView];
    UIView *listItem = [barButtonItem viewWithTag:kListItemViewTag];
    UIView *posterItem = [barButtonItem viewWithTag:kPosterItemViewTag];

    [self animationView:barButtonItem withFlag:posterItem.hidden];
    [self animationView:self.view withFlag:posterItem.hidden];
    
    if (posterItem.hidden) {
        posterItem.hidden = NO;
        listItem.hidden = YES;
    }
    else {
        posterItem.hidden = YES;
        listItem.hidden = NO;
    }
}

#pragma mark - Memory Manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if (self.view.window == nil) {
        
        [_listView release], _listView = nil;
        [_posterView release], _posterView = nil;
        self.view = nil;
        
    }// 将视图控制器中的强引用释放
}

@end
