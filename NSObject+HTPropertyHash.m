//
//  NSObject+HTPropertyHash.m
//  HotelTonight
//
//  Created by Jacob Jennings on 11/28/12.
//  Copyright (c) 2012 Hotel Tonight. All rights reserved.
//

#import "NSObject+HTPropertyHash.h"
#import "MARTNSObject.h"

@implementation NSObject (HTPropertyHash)

- (NSString *)hashStringForKeyPaths:(NSArray *)propertyNames
{
    NSMutableString *hashString = [[NSMutableString alloc] initWithString:NSStringFromClass([self class])];
    for (NSString *propertyName in propertyNames)
    {
        NSObject *objectForKeyPath = [self valueForKeyPath:propertyName];
        NSString *description = [objectForKeyPath description];
        if ([objectForKeyPath isKindOfClass:[NSArray class]])
        {
            NSMutableString *descriptionMutable = [[NSMutableString alloc] init];
            [descriptionMutable appendString:@"( "];
            for (NSObject *object in (NSArray *)objectForKeyPath)
            {
                if (CFGetTypeID((__bridge CFTypeRef)object) == CGColorGetTypeID()) {
                    CGColorRef colorRef = (CGColorRef)CFBridgingRetain(object);
                    [descriptionMutable appendFormat:@"%@, ", [self descriptionForCGColor:colorRef]];
                }
                else
                {
                    [descriptionMutable appendFormat:@"%@, ", object];
                }
                description = [descriptionMutable copy];
            }
            [descriptionMutable appendString:@")"];
        }
        
        [hashString appendFormat:@"\n%@: %@", propertyName, description];
    }
    return hashString;
}

- (NSString *)descriptionForCGColor:(CGColorRef)colorRef;
{
    const CGFloat *colorComponents = CGColorGetComponents(colorRef);
    return [NSString stringWithFormat:@"(%f %f %f %f)", colorComponents[0], colorComponents[1], colorComponents[2], colorComponents[3]];
}

@end
