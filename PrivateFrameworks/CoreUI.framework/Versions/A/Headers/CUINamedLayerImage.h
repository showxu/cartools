#import <CoreUI/CUINamedImage.h>

@interface CUINamedLayerImage: CUINamedImage {
    int  _blendMode;
    BOOL  _fixedFrame;
    CGRect _frame;
    double  _opacity;
}

@property (nonatomic) int blendMode;
@property (nonatomic) BOOL fixedFrame;
@property (nonatomic) CGRect frame;
@property (nonatomic) double opacity;

- (id)initWithName:(id)arg1 usingRenditionKey:(id)arg2 fromTheme:(unsigned long long)arg3;
- (void)setOpacity:(double)arg1;

@end
