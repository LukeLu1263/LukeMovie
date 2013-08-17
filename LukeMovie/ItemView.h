//
//  ItemView.h
//  LukeMovie
//
//  Created by Luke Lu on 13-8-17.
//  Copyright (c) 2013年 www.lukelu.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemView;
@protocol ItemViewDelegate <NSObject>
@optional
- (void)didSelectedItemView:(ItemView *)itemView atIndex:(NSInteger)index;
@end

@interface ItemView : UIView
{
@private
    UIImageView *_item;
    UILabel *_title;
    id<ItemViewDelegate> _delegate;
}

@property(nonatomic, readonly) UIImageView *item;
@property(nonatomic, readonly) UILabel *title;
@property(nonatomic, assign) id<ItemViewDelegate> delegate;

@end
