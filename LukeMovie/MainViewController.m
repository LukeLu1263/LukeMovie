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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadViewControllers];
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

@end
