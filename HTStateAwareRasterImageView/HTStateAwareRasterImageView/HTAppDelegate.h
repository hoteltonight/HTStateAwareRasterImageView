//
//  HTAppDelegate.h
//  HTStateAwareRasterImageView
//
//  Created by Jacob Jennings on 12/6/12.
//  Copyright (c) 2012 HotelTonight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTViewController;

@interface HTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HTViewController *viewController;

@end
