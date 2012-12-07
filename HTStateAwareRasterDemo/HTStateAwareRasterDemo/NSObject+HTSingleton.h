//
//  NSObject+HTSingleton.h
//  HTStateAwareRasterDemo
//
//  Created by Jacob Jennings on 12/7/12.
//  Copyright (c) 2012 HotelTonight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HTSingleton)

+ (instancetype)shared;

@end
