#import <Foundation/Foundation.h>
#import <CoreThemeDefinition/CDStructures.h>

@interface CUIThemeRendition : NSObject {
    unsigned long long  _colorSpaceID;
    struct _renditionkeytoken * _key;
    NSString * _name;
    double  _opacity;
    CGSize _physicalSizeInMeters;
    NSDictionary * _properties;
    unsigned int  _scale;
    struct _renditionkeytoken _stackKey;
    long long  _templateRenderingMode;
    CGImageRef _uncroppedImage;
    NSString * _utiType;
}

@property (nonatomic) int blendMode;
@property (nonatomic) int exifOrientation;
@property (nonatomic, retain) NSString *internalName;
@property (nonatomic) unsigned int internalScale;
@property (nonatomic) long long internalTemplateRenderingMode;
@property (nonatomic) double opacity;
@property (nonatomic, readonly) NSData *srcData;
@property (nonatomic) unsigned int subtype;
@property (nonatomic) long long type;

+ (id)displayNameForRenditionType:(long long)arg1;
+ (Class)renditionClassForRenditionType:(long long)arg1 andPixelFormat:(unsigned int)arg2;

- (CGRect)_destinationFrame;
- (id)_initWithCSIData:(id)arg1 forKey:(const struct _renditionkeytoken *)arg2;
- (void)_initializeRenditionKey:(const struct _renditionkeytoken *)arg1;
- (void)_initializeTypeIdentifiersWithLayout:(unsigned short)arg1;
- (void)_setFlippable:(BOOL)arg1;
- (void)_setStructuredThemeStore:(id)arg1;
- (id)_sourceRendition;
- (CGRect)alphaCroppedRect;
- (id)assetPackIdentifier;
- (int)bitmapEncoding;
- (CGColorRef)cgColor;
- (unsigned long long)colorSpaceID;
- (id)contentNames;
- (CGImageRef)createImageFromPDFRenditionWithScale:(double)arg1;
- (NSData *)data;
- (BOOL)edgesOnly;
- (id)effectPreset;
- (id)externalTags;
- (id)gradient;
- (double)gradientDrawingAngle;
- (unsigned int)gradientStyle;
- (id)imageForSliceIndex:(long long)arg1;
- (id)initWithCSIData:(id)arg1 forKey:(const struct _renditionkeytoken *)arg2;
- (id)internalName;
- (unsigned int)internalScale;
- (long long)internalTemplateRenderingMode;
- (BOOL)isFlippable;
- (BOOL)isInternalLink;
- (BOOL)isOpaque;
- (BOOL)isScaled;
- (BOOL)isTiled;
- (BOOL)isTintable;
- (BOOL)isVectorBased;
- (const struct _renditionkeytoken *)key;
- (id)layerReferences;
- (id)linkingToRendition;
- (id)maskForSliceIndex:(long long)arg1;
- (id)metrics;
- (id)mipLevels;
- (id)modelAsset;
- (id)modelMesh;
- (id)modelSubmesh;
- (NSString *)name;
- (int)objectVersion;
- (double)opacity;
- (BOOL)optOutOfThinning;
- (CGSize)originalUncroppedSize;
- (CGPDFDocumentRef)pdfDocument;
- (CGSize)physicalSizeInMeters;
- (int)pixelFormat;
- (BOOL)preservedVectorRepresentation;
- (id)properties;
- (id)provideTextureInfo;
- (double)scale;
- (void)setInternalScale:(unsigned int)arg1;
- (void)setInternalTemplateRenderingMode:(long long)arg1;
- (void)setName:(id)arg1;
- (void)setOpacity:(double)arg1;
- (id)sizeIndexes;
- (id)sliceInformation;
- (unsigned long long)sourceRowbytes;
- (BOOL)substituteWithSystemColor;
- (struct CGSVGDocument { }*)svgDocument;
- (id)systemColorName;
- (long long)templateRenderingMode;
- (id)textureImages;
- (long long)textureIntepretation;
- (CGImageRef)uncroppedImage;
- (CGImageRef)unslicedImage;
- (CGSize)unslicedSize;
- (id)utiType;
- (id)vectorGlyphAvailableSizes;
- (double)vectorGlyphBaseline;
- (double)vectorGlyphCapLine;
- (double)vectorGlyphReferencePointSize;
- (float)vectorGlyphTemplateVersion;

@end
