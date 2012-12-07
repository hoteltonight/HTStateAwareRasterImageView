//
//  HTStateAwareRasterImageView.h
//  HotelTonight
//
//  Created by Jacob Jennings on 11/29/12.
//  Copyright (c) 2012 Hotel Tonight. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HTSARIVVoidBlock)();

@protocol HTRasterizableView <NSObject>

- (NSArray *)keyPathsThatAffectState;

@optional
- (UIEdgeInsets)capEdgeInsets;

// YES means 1px between caps vertically and horizontally for draw size.  capEdgeInsets must be implemented for this.
- (BOOL)useMinimumFrameForCaps;

- (BOOL)shouldRegenerateRasterForKeyPath:(NSString *)keyPath change:(NSDictionary *)dictionary;

@end

@class HTStateAwareRasterImageView;
@protocol HTStateAwareRasterImageViewDelegate <NSObject>

@optional
- (void)rasterWrapperWillRegenerateImage:(HTStateAwareRasterImageView *)rasterWrapper; // May be called outside main thread
- (void)rasterWrapperImageLoaded;

@end

@interface HTStateAwareRasterImageView : UIImageView

@property (nonatomic, strong) UIView<HTRasterizableView> *rasterizableView;
@property (nonatomic, assign) BOOL drawsOnMainThread;
@property (atomic, assign) id<HTStateAwareRasterImageViewDelegate> delegate;

// For prerendering only
@property (nonatomic, assign) BOOL kvoEnabled;
- (void)regenerateImage:(HTSARIVVoidBlock)complete;

@end
