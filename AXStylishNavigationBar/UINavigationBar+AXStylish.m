//
//  UINavigationBar+AXStylish.m
//  
//
//  Created by XuXudong on 15/12/12.
//
//

#import "UINavigationBar+AXStylish.h"
#import <objc/runtime.h>

@implementation UINavigationBar (AXStylish)

#pragma mark - Setter & Getter
- (void)setAx_navigationBarBackground:(UIImageView *)navigationBarBackground
{
    objc_setAssociatedObject(self, @selector(ax_navigationBarBackground), navigationBarBackground, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImageView *)ax_navigationBarBackground
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAx_backdropView:(UIView *)backdropView
{
    objc_setAssociatedObject(self, @selector(ax_backdropView), backdropView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ax_backdropView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAx_backdropEffectView:(UIView *)backdropEffectView
{
    objc_setAssociatedObject(self, @selector(ax_backdropEffectView), backdropEffectView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ax_backdropEffectView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAx_leftViews:(NSArray *)leftViews
{
    objc_setAssociatedObject(self, @selector(ax_leftViews), leftViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)ax_leftViews
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAx_rightViews:(NSArray *)rightViews
{
    objc_setAssociatedObject(self, @selector(ax_rightViews), rightViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)ax_rightViews
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAx_titleView:(UIView *)titleView
{
    objc_setAssociatedObject(self, @selector(ax_titleView), titleView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ax_titleView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAx_showShadowView:(BOOL)flag;
{
    [self associateBackgroundView];
    self.ax_navigationBarBackground.clipsToBounds = !flag;
}

- (void)setAx_backIndicatorView:(UIView *)backIndicatorView
{
    objc_setAssociatedObject(self, @selector(ax_backIndicatorView), backIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)ax_backIndicatorView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (BOOL)ax_showShadowView
{
    [self associateBackgroundView];
    return self.ax_navigationBarBackground.clipsToBounds;
}

- (void)ax_setBlurBackgroundAlpha:(CGFloat)alpha
{
    [self associateBackgroundView];
    self.ax_backdropEffectView.alpha = alpha;
}

- (void)ax_setBackgroundColor:(UIColor *)aColor
{
    [self associateBackgroundView];
    self.ax_backdropView.backgroundColor = aColor;
}

- (void)ax_setBackgroundColorAlpha:(CGFloat)alpha
{
    [self associateBackgroundView];
    [self ax_setBackgroundColor:[self.ax_backdropView.backgroundColor colorWithAlphaComponent:alpha]];
}

- (void)ax_setBackgroundImage:(UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics
{
    [self associateBackgroundView];
    UIColor *tempColor = self.ax_navigationBarBackground.backgroundColor;
    [self setBackgroundImage:backgroundImage forBarMetrics:barMetrics];
    [self ax_setBackgroundImageBackgroundColor:tempColor];
}

- (void)ax_setBackgroundImageBackgroundColor:(UIColor *)aColor
{
    [self associateBackgroundView];
    self.ax_navigationBarBackground.backgroundColor = aColor;
}

- (void)ax_setBackgroundImageBackgroundColorAlpha:(CGFloat)alpha
{
    [self associateBackgroundView];
    [self ax_setBackgroundImageBackgroundColor:[self.ax_navigationBarBackground.backgroundColor colorWithAlphaComponent:alpha]];
}

- (void)ax_clearBackgroundImage
{
    UIColor *tempColor = self.ax_navigationBarBackground.backgroundColor;
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self associateBackgroundView];
    [self ax_setBackgroundImageBackgroundColor:tempColor];
}

- (void)ax_setLeftViewsAlpha:(CGFloat)alpha
{
    [self associateLeftViews];
    [self.ax_leftViews enumerateObjectsUsingBlock:^(UIView *aView, NSUInteger idx, BOOL *stop) {
        aView.alpha = alpha;
    }];
}

- (void)ax_setBackIndicatorViewAlpha:(CGFloat)alpha
{
    [self associateBackIndicatorView];
    self.ax_backIndicatorView.alpha = alpha;
}

- (void)ax_setRightViewsAlpha:(CGFloat)alpha
{
    [self associateRightViews];
    [self.ax_rightViews enumerateObjectsUsingBlock:^(UIView *aView, NSUInteger idx, BOOL *stop) {
        aView.alpha = alpha;
    }];
}

- (void)ax_setTitleViewAlpha:(CGFloat)alpha
{
    [self associateTitleViews];
    self.ax_titleView.alpha = alpha;
}

- (void)ax_selfOffCenteringOffsetX:(CGFloat)offsetX offsetY:(CGFloat)offsetY
{
    self.transform = CGAffineTransformMakeTranslation(offsetX, offsetY);
}

- (void)associateBackgroundView
{
    // a _UINavigationBarBackground
    self.ax_navigationBarBackground = [self valueForKey:@"_backgroundView"];
    
    // a UIView
    [self.ax_navigationBarBackground.subviews enumerateObjectsUsingBlock:^(UIView *aView, NSUInteger idx, BOOL *stop) {
            if ([aView isKindOfClass:NSClassFromString(@"_UIBackdropView")])
                self.ax_backdropView = aView; }];
    
    // a UIView
    [self.ax_backdropView.subviews enumerateObjectsUsingBlock:^(UIView *aView, NSUInteger idx, BOOL *stop) {
        if ([aView isKindOfClass:NSClassFromString(@"_UIBackdropEffectView")])
            self.ax_backdropEffectView = aView;
        self.ax_backdropEffectView.alpha = 0.000; }];
}

/**
 *You should not and must not use sentence like
 *```
 *  if (!self.ax_leftViews) or if (!self.ax_leftViews.count)
 *```
 * to check, cause you will always get NO for returen value.
 */
- (void)associateLeftViews
{
    self.ax_leftViews = [self valueForKey:@"_leftViews"];
}

- (void)associateRightViews
{
    self.ax_rightViews = [self valueForKey:@"_rightViews"];
}

- (void)associateTitleViews
{
    self.ax_titleView = [self valueForKey:@"_titleView"];
}

- (void)associateBackIndicatorView
{
    self.ax_backIndicatorView = [self valueForKey:@"_backIndicatorView"];
}

@end
