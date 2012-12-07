//
//  HTExampleTableCell.h
//  HTStateAwareRasterDemo
//
//  Created by Jacob Jennings on 12/6/12.
//  Copyright (c) 2012 HotelTonight. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTExampleRasterizableComponent.h"

static NSString * const HTExampleTableCellReuseIdentifier = @"HTExampleTableCellReuseIdentifier";

@interface HTExampleTableCell : UITableViewCell

@property (nonatomic, strong) HTExampleRasterizableComponent *rasterizableComponent;

@end
