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
- (void)loadViewControllers;
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
    _tabBarBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDeviceHeight-49, kDeviceWidth, 49)];
    _tabBarBackground.image = [UIImage imageNamed:@"tab_bg_all"];
    _tabBarBackground.userInteractionEnabled = YES;
    [self.view addSubview:_tabBarBackground];
    
    _selectedImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, _tabBarBackground.height/2.0-45.0/2, 50, 45)];
    _selectedImage.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [_tabBarBackground addSubview:_selectedImage];

    NSArray *imgs = @[@"movie_home", @"msg_new",@"start_top250", @"movie_cinema", @"more_setting"];
    NSArray *titles = @[@"电影", @"新闻", @"Top", @"影院", @"更多"];
    
    int x = 0;
    for (int i = 0; i<5; i++) {
        UIImageView *itemView = [[UIImageView alloc] initWithFrame:CGRectMake(20+x, 10, 22, 22)];
        itemView.tag = i;
        itemView.contentMode = UIViewContentModeScaleAspectFit;
        itemView.userInteractionEnabled = YES;
        itemView.image = [UIImage imageNamed:imgs[i]];
        [_tabBarBackground addSubview:itemView];
        [itemView release];

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(itemView.left, itemView.bottom+2, itemView.width, 10)];
        title.text = titles[i];
        title.backgroundColor = [UIColor clearColor];
        title.textColor = [UIColor whiteColor];
        title.font = [UIFont boldSystemFontOfSize:10];
        title.textAlignment = NSTextAlignmentCenter;
        [_tabBarBackground addSubview:title];
        [title release];

        x += itemView.width+43;

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(test:)];
        [itemView addGestureRecognizer:tap];
        [tap release];
    }
}

- (void)test:(UIGestureRecognizer *)tap
{
    UIView *view = [tap view];
    [UIView beginAnimations:nil context:NULL];
    _selectedImage.frame = CGRectMake(5 + 65 * view.tag, _tabBarBackground.height/2.0-45.0/2, 50, 45);
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
