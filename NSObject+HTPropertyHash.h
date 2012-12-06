//
//  NSObject+HTPropertyHash.h
//  HotelTonight
//
//  Created by Jacob Jennings on 11/28/12.
//  Copyright (c) 2012 Hotel Tonight. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HTPropertyHash)

- (NSString *)hashStringForKeyPaths:(NSArray *)propertyNames;

@end
