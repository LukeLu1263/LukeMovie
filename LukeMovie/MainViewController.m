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


@interface MainViewController ()
- (void)loadViewControllers;
- (void)customTabBarView;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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


- (void)customTabBarView
{
    _tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDeviceHeight-49, kDeviceWidth, 49)];
    _tabBarBG.image = [UIImage imageNamed:@"tab_bg_all"];
    _tabBarBG.userInteractionEnabled = YES;
    [self.view addSubview:_tabBarBG];
    
    _selectedImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, _tabBarBG.height/2.0-45.0/2, 50, 45)];
    _selectedImage.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [_tabBarBG addSubview:_selectedImage];
    
}

- (void)loadViewControllers
{
    USAViewController *usaViewController = [[USAViewController alloc] init];
    UINavigationController *usaNav = [[UINavigationController alloc] initWithRootViewController:usaViewController];
    [usaViewController release];

    //    // systemItem
    //    UITabBarItem *usaItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    //    usaViewController.tabBarItem = usaItem;
    //    [usaItem release];
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    UINavigationController *newsNav = [[UINavigationController alloc] initWithRootViewController:newsViewController];
    [newsViewController release];
    
    TopViewController *topViewController = [[TopViewController alloc] init];
    UINavigationController *topNav = [[UINavigationController alloc] initWithRootViewController:topViewController];
    [topViewController release];
    
    CinemaViewController *cinemaViewController = [[CinemaViewController alloc] init];
    UINavigationController *cinemaNav = [[UINavigationController alloc] initWithRootViewController:cinemaViewController];
    [cinemaViewController release];
    
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    UINavigationController *moreNav = [[UINavigationController alloc] initWithRootViewController:moreViewController];
    [moreViewController release];

    
    NSArray *viewControllers = @[usaNav, newsNav, topNav, cinemaNav, moreNav];
    [self setViewControllers:viewControllers animated:YES];

    [usaNav release];
    [newsNav release];
    [topNav release];
    [cinemaNav release];
    [moreNav release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_tabBarBG release], _tabBarBG = nil;
    [_selectedImage release], _selectedImage = nil;
    [super dealloc];
}

@end
