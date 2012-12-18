//
//  UIView+HTDrawInContext.m
//  HotelTonight
//
//  Created by Jacob Jennings on 11/29/12.
//  Copyright (c) 2012 Hotel Tonight. All rights reserved.
//

#import "UIView+HTDrawInContext.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (HTDrawInContext)

- (void)drawRect:(CGRect)rect inContext:(CGContextRef)context;
{
    [self layoutSubviews];
    if (self.layer.mask)
    {
        UIImage *layerMaskImage = [self layerMaskImage];
        CGContextClipToMask(context, rect, layerMaskImage.CGImage);
    }
    [self.layer renderInContext:context];
}

- (UIImage *)layerMaskImage
{
    if ([self.layer.mask isKindOfClass:[CAShapeLayer class]])
    {
        ((CAShapeLayer *)self.layer.mask).fillColor = [UIColor whiteColor].CGColor;
    }

    CGSize size = CGSizeMake(self.frame.size.width * self.layer.contentsScale, self.frame.size.height * self.layer.contentsScale);

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 0, colorSpace, kCGImageAlphaNone);
    
    CGContextScaleCTM(context, self.layer.contentsScale, self.layer.contentsScale);
    [self.layer.mask renderInContext:context];
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *outputImage = [UIImage imageWithCGImage:imageRef];
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
        
    return outputImage;
}

@end
