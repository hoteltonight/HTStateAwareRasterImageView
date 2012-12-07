//
//  HTCacheKeyCollector.m
//  HTStateAwareRasterDemo
//
//  Created by Jacob Jennings on 12/7/12.
//  Copyright (c) 2012 HotelTonight. All rights reserved.
//

#import "HTCacheKeyCollector.h"

@interface HTCacheKeyCollector ()

@end

@implementation HTCacheKeyCollector

- (id)init
{
    self = [super init];
    if (self)
    {
        _cacheKeys = [NSMutableArray array];
    }
    return self;
}

- (void)cacheKeyAdded:(NSString *)cacheKey;
{
    [self.cacheKeys addObject:cacheKey];
}

@end
