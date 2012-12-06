//
//  HTStateAwareRasterImageView.h
//  HotelTonight
//
//  Created by Jacob Jennings on 11/29/12.
//  Copyright (c) 2012 Hotel Tonight. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HTRasterizableView <NSObject>

- (NSArray *)keyPathsThatAffectState;

@optional
- (UIEdgeInsets)capEdgeInsets;

// YES means 1px between caps vertically and horizontally for draw size.  capEdgeInsets must be implemented for this.
- (BOOL)useMinimumFrameForCaps;

- (BOOL)shouldRegenerateRasterForKeyPath:(NSString *)keyPath change:(NSDictionary *)dictionary;

@end

@class HTStateAwareRasterImageView;
@protocol HTRasterWrapperDelegate <NSObject>

@optional
- (void)rasterWrapperWillRegenerateImage:(HTStateAwareRasterImageView *)rasterWrapper; // May be called outside main thread
- (void)rasterWrapperImageLoaded;

@end

@interface HTStateAwareRasterImageView : UIImageView

@property (nonatomic, strong) UIView<HTRasterizableView> *rasterizableView;
@property (nonatomic, assign) BOOL drawsOnMainThread;
@property (atomic, assign) id<HTRasterWrapperDelegate> delegate;

// For prerendering only
@property (nonatomic, assign) BOOL kvoEnabled;
- (void)regenerateImage:(HTVoidBlock)complete;

@end
