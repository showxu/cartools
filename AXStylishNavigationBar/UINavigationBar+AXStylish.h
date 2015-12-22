//
//  UINavigationBar+AXStylish.h
//  
//
//  Created by XuXudong on 15/12/12.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (AXStylish)

@property (nonatomic, assign, setter=setAx_ShowShadowImage:) BOOL ax_showShadowImage;

- (void)ax_setBackgroudColor:(UIColor *)aColor;
- (void)ax_setBackgroundColorAlpha:(CGFloat)alpha;
- (void)ax_selfOffCenteringWithOffsetX:(CGFloat)offsetX y:(CGFloat)offsetY;
- (void)ax_scaleWithScaleFactorX:(CGFloat)scaleX y:(CGFloat)scaleY;
- (void)ax_rotateWithAngle:(CGFloat)angle;

@end
