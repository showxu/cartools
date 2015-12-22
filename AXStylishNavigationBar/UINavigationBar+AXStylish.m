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
- (void)setNavigationBarBackground:(UIView *)aView
{
    objc_setAssociatedObject(self, @selector(navigationBarBackground), aView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)navigationBarBackground
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBackdropView:(UIView *)aView
{
    objc_setAssociatedObject(self, @selector(backdropView), aView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)backdropView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBackdropEffectView:(UIView *)aView
{
    objc_setAssociatedObject(self, @selector(backdropEffectView), aView, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)backdropEffectView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setAx_ShowShadowImage:(BOOL)flag;
{
    [self associateSubviews];
    self.navigationBarBackground.clipsToBounds = !flag;
}

- (BOOL)ax_showShadowImage
{
    [self associateSubviews];
    return self.navigationBarBackground.clipsToBounds;
}

- (void)ax_setBackgroudColor:(UIColor *)aColor
{
    //[self associateSubviews];
    //self.backdropView.alpha = 0.000;
    self.backdropEffectView.alpha = 0.000;
    self.backdropView.backgroundColor = aColor;
}

- (void)ax_setBackgroundColorAlpha:(CGFloat)alpha
{
    //[self associateSubviews];
    //self.backdropView.alpha = 0.000;
    self.backdropEffectView.alpha = 0.000;
    [self ax_setBackgroudColor:[self.backdropView.backgroundColor colorWithAlphaComponent:alpha]];
}

- (void)ax_selfOffCenteringWithOffsetX:(CGFloat)offsetX y:(CGFloat)offsetY
{
    self.transform = CGAffineTransformMakeTranslation(offsetX, offsetY);
}

- (void)ax_scaleWithScaleFactorX:(CGFloat)scaleX y:(CGFloat)scaleY
{
    self.transform = CGAffineTransformMakeScale(scaleX, scaleY);
}

- (void)ax_rotateWithAngle:(CGFloat)angle
{
    self.transform = CGAffineTransformMakeRotation(angle);
}

- (void)associateSubviews
{
    if (!self.navigationBarBackground)
        [self.subviews enumerateObjectsUsingBlock:^(UIView *aView, NSUInteger idx, BOOL *stop) {
            if ([aView isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")])
                self.navigationBarBackground = aView; }];
    
    if (!self.backdropView)
        [self.navigationBarBackground.subviews enumerateObjectsUsingBlock:^(UIView *aView, NSUInteger idx, BOOL *stop) {
            if ([aView isKindOfClass:NSClassFromString(@"_UIBackdropView")])
                self.backdropView = aView; }];
    
    if (!self.backdropEffectView)
        [self.backdropView.subviews enumerateObjectsUsingBlock:^(UIView *aView, NSUInteger idx, BOOL *stop) {
            if ([aView isKindOfClass:NSClassFromString(@"_UIBackdropView")])
                self.backdropEffectView = aView;
            self.backdropEffectView.alpha = 0.000; }];
}

@end
