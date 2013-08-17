//
//  MainViewController.m
//  LukeMovie
//
//  Created by Luke Lu on 13-8-9.
//  Copyright (c) 2013年 www.lukelu.org. All rights reserved.
//

#import "MainViewController.h"
#import "USAViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "TopViewController.h"
#import "NewsViewController.h"
#import "BaseNavigationController.h"


@interface MainViewController ()

// 装载子视图控制器
- (void)loadViewControllers;

// 自定义TabBarView
- (void)customTabBarView;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBar.hidden = YES;
    }
    return self;
}

#pragma mark - ViewController Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadViewControllers];
    [self customTabBarView];
}

#pragma mark - private
- (void)customTabBarView
{
    // tabBar背景
    _tabBarBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDeviceHeight-49, kDeviceWidth, 49)];
    _tabBarBackground.image = [UIImage imageNamed:@"tab_bg_all"];
    _tabBarBackground.userInteractionEnabled = YES;
    [self.view addSubview:_tabBarBackground];
    
    // 选中时的图片
    _selectedImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, _tabBarBackground.height/2.0-45.0/2, 50, 45)];
    _selectedImage.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [_tabBarBackground addSubview:_selectedImage];

    // tabBar每一个itemView
    NSArray *imgs = @[@"movie_home", @"msg_new",@"start_top250", @"movie_cinema", @"more_setting"];
    NSArray *titles = @[@"电影", @"新闻", @"Top", @"影院", @"更多"];
    int x = 0;
    for (int i = 0; i<5; i++) {

        ItemView *itemView = [[ItemView alloc] initWithFrame:CGRectMake(5+x, _tabBarBackground.height/2.0-45/2.0, 50, 45)];
        itemView.tag = i;
        itemView.delegate = self;
        itemView.item.image = [UIImage imageNamed:imgs[i]];
        itemView.title.text = titles[i];
        [_tabBarBackground addSubview:itemView];
        [itemView release];

        x += 65;
    }
}

// 选中某个itemView
- (void)didSelectedItemView:(ItemView *)itemView atIndex:(NSInteger)index
{
    [UIView beginAnimations:nil context:NULL];
    _selectedImage.frame = CGRectMake(5 + 65 * itemView.tag, _tabBarBackground.height/2-45.0/2, 50, 45);
    [UIView commitAnimations];
}

- (void)loadViewControllers
{
    USAViewController *usaViewController = [[USAViewController alloc] init];
    BaseNavigationController *usaNav = [[BaseNavigationController alloc] initWithRootViewController:usaViewController];
    [usaViewController release];

    //    // systemItem
    //    UITabBarItem *usaItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    //    usaViewController.tabBarItem = usaItem;
    //    [usaItem release];
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    BaseNavigationController *newsNav = [[BaseNavigationController alloc] initWithRootViewController:newsViewController];
    [newsViewController release];
    
    TopViewController *topViewController = [[TopViewController alloc] init];
    BaseNavigationController *topNav = [[BaseNavigationController alloc] initWithRootViewController:topViewController];
    [topViewController release];
    
    CinemaViewController *cinemaViewController = [[CinemaViewController alloc] init];
    BaseNavigationController *cinemaNav = [[BaseNavigationController alloc] initWithRootViewController:cinemaViewController];
    [cinemaViewController release];
    
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    BaseNavigationController *moreNav = [[BaseNavigationController alloc] initWithRootViewController:moreViewController];
    [moreViewController release];

    
    NSArray *viewControllers = @[usaNav, newsNav, topNav, cinemaNav, moreNav];
    [self setViewControllers:viewControllers animated:YES];

    [usaNav release];
    [newsNav release];
    [topNav release];
    [cinemaNav release];
    [moreNav release];
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_tabBarBackground release], _tabBarBackground = nil;
    [_selectedImage release], _selectedImage = nil;
    [super dealloc];
}

@end
