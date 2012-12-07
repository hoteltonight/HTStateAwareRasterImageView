//
//  HTExampleTableCell.m
//  HTStateAwareRasterDemo
//
//  Created by Jacob Jennings on 12/6/12.
//  Copyright (c) 2012 HotelTonight. All rights reserved.
//

#import "HTExampleTableCell.h"

@interface HTExampleTableCell ()

@property (nonatomic, strong) HTStateAwareRasterImageView *stateAwareRasterImageView;

@end

@implementation HTExampleTableCell

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HTExampleTableCellReuseIdentifier];
    if (self) {
        _rasterizableComponent = [[HTExampleRasterizableComponent alloc] init];
        _stateAwareRasterImageView = [[HTStateAwareRasterImageView alloc] init];
        _stateAwareRasterImageView.rasterizableView = _rasterizableComponent;
        [self addSubview:_stateAwareRasterImageView];
//        [self addSubview:_rasterizableComponent];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.stateAwareRasterImageView.frame = self.bounds;
//    self.rasterizableComponent.frame = self.bounds;
}

@end
