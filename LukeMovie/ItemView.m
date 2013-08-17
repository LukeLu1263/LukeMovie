//
//  ItemView.m
//  LukeMovie
//
//  Created by Luke Lu on 13-8-17.
//  Copyright (c) 2013年 www.lukelu.org. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubView];
        [self addGesture];
    }
    return self;
}

- (void)initSubView
{
    _item = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2.0-22/2.0, 5, 22, 22)];
    _item.contentMode = UIViewContentModeScaleAspectFit;
    _item.userInteractionEnabled = YES;
    [self addSubview:_item];
    [_item release];
    
    _title = [[UILabel alloc] initWithFrame:CGRectMake(0, _item.bottom+5, self.width, 10)];
    _title.backgroundColor = [UIColor clearColor];
    _title.textColor = [UIColor whiteColor];
    _title.font = [UIFont boldSystemFontOfSize:10];
    _title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_title];
    [_title release];
    
}

- (void)addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelected:)];
    [self addGestureRecognizer:tap];
    [tap release];
}

#pragma mark - Target Actions
- (void)didSelected:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(didSelectedItemView:atIndex:)]) {
        [self.delegate didSelectedItemView:self atIndex:self.tag];
    }
}

- (void)dealloc
{
    [_item release], _item = nil;
    [_title release], _title = nil;
    [super dealloc];
}
@end
