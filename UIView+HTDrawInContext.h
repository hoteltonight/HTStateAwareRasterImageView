//
//  UIView+HTDrawInContext.h
//  HotelTonight
//
//  Created by Jacob Jennings on 11/29/12.
//  Copyright (c) 2012 Hotel Tonight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HTDrawInContext)

- (void)drawRect:(CGRect)rect inContext:(CGContextRef)context;

@end
