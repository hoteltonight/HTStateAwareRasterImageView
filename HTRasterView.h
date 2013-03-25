//
//  HTRasterView.h
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
- (CGFloat)shadowRenderOutset; // if you're drawing shadows or something outside of your frame.

// YES means 1pt between caps vertically and horizontally for draw size.  capEdgeInsets must be implemented for this.
- (BOOL)useMinimumFrameForCaps;

- (BOOL)shouldRegenerateRasterForKeyPath:(NSString *)keyPath change:(NSDictionary *)dictionary;

@end

@class HTRasterView;
@protocol HTRasterViewDelegate <NSObject>

@optional
- (void)rasterViewWillRegenerateImage:(HTRasterView *)rasterView; // May be called outside main thread
- (void)rasterViewImageLoaded:(HTRasterView *)rasterView;

@end

@interface HTRasterView : UIView

@property (nonatomic, strong) UIView<HTRasterizableView> *rasterizableView;
@property (nonatomic, assign) BOOL drawsOnMainThread;
@property (atomic, assign) id<HTRasterViewDelegate> delegate;
@property (nonatomic, assign) BOOL rasterized; // Default YES, change to NO to add rasterizableView as a subview
@property (nonatomic, readonly) UIImage *image;

- (NSString *)cacheKey;
- (void)registerDescendantRasterView:(HTRasterView *)descendant;
- (void)unregisterDescendantRasterView:(HTRasterView *)descendant;

// For prerendering only
@property (nonatomic, assign) BOOL kvoEnabled;
- (void)regenerateImage:(HTSARIVVoidBlock)complete;

@end
