//
//  MainViewController.h
//  LukeMovie
//
//  Created by Luke Lu on 13-8-9.
//  Copyright (c) 2013年 www.lukelu.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemView.h"

@interface MainViewController : UITabBarController<ItemViewDelegate>
{
    @private
    UIImageView *_tabBarBackground;
    UIImageView *_selectedImage;
}
@end
