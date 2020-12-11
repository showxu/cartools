#import <Foundation/Foundation.h>

@class CUINamedLookup;

@interface CUINamedLayerStack : CUINamedLookup {
    NSArray * _layers;
}

@property (nonatomic, readonly) CGImageRef flattenedImage;
@property (nonatomic, retain) NSArray *layers;
@property (nonatomic, readonly) CGImageRef radiosityImage;
@property (nonatomic, readonly) CGSize size;

+ (CGImageRef)createRadiosityImageWithImage:(CGImageRef)arg1 displayScale:(long long)arg2;
+ (void)radiosityImageWithImage:(CGImageRef)arg1 displayScale:(long long)arg2 completionHandler:(id)arg3;
- (CGImageRef)flattenedImage;
- (id)initWithName:(id)arg1 usingRenditionKey:(id)arg2 fromTheme:(unsigned long long)arg3 resolvingWithBlock:(id)arg4;
- (id)layerImageAtIndex:(unsigned long long)arg1;
- (CGImageRef)radiosityImage;

@end
