#import <Foundation/Foundation.h>

@class CUICommonAssetStorage, CUIThemeRendition;

@interface CUIStructuredThemeStore: NSObject {
    NSString * _bundleID;
    NSMutableDictionary * _cache;
    NSSet * _legacyFlippableSet;
    unsigned int  _mainBundle;
    NSCache * _namedRenditionKeyCache;
    CUICommonAssetStorage * _store;
    unsigned long long  _themeIndex;
}

@property (readonly, copy) NSString *debugDescription;
@property (readonly, copy) NSString *description;
@property (readonly) unsigned long long hash;
@property BOOL mainBundle;
@property (readonly) Class superclass;

- (id)aliasForName:(id)arg1;
- (id)allImageNames;
- (unsigned short)appearanceIdentifierForName:(id)arg1;
- (id)appearances;
- (BOOL)assetExistsForKey:(const struct _renditionkeytoken *)arg1;
- (unsigned int)authoredWithSchemaVersion;
- (id)baseGradationKeySignatureForKey:(const struct _renditionkeytoken *)arg1;
- (id)bundleID;
- (BOOL)caAllowSubimageOfImage:(CGImageRef)arg1;
- (BOOL)canGetRenditionWithKey:(const struct _renditionkeytoken *)arg1;
- (id)catalogGlobals;
- (void)clearRenditionCache;
- (unsigned long long)colorSpaceID;
- (BOOL)containsLookupForName:(id)arg1;
- (id)defaultAppearanceName;
- (unsigned int)distilledInCoreUIVersion;
- (unsigned int)documentFormatVersion;
- (double)fontSizeForFontSizeType:(id)arg1;
- (BOOL)getFontName:(id*)arg1 baselineOffset:(double*)arg2 forFontType:(id)arg3;
- (BOOL)getPhysicalColor:(CGColorRef)arg1 withName:(id)arg2;
- (BOOL)hasPhysicalColorWithName:(id)arg1;
- (BOOL)imageNamedShouldFlip:(id)arg1;
- (id)imagesWithName:(id)arg1;
- (id)initWithBytes:(const void*)arg1 length:(unsigned long long)arg2;
- (id)initWithPath:(id)arg1;
- (id)initWithURL:(id)arg1;
- (unsigned short)localizationIdentifierForName:(id)arg1;
- (id)localizations;
- (id)lookupAssetForKey:(const struct _renditionkeytoken *)arg1;
- (BOOL)mainBundle;
- (id)mappedAliases;
- (long long)maximumRenditionKeyTokenCount;
- (id)nameForAppearanceIdentifier:(unsigned short)arg1;
- (id)renditionInfoForIdentifier:(unsigned short)arg1;
- (const struct _renditionkeytoken *)renditionKeyForName:(id)arg1;
- (const struct _renditionkeytoken *)renditionKeyForName:(id)arg1 cursorHotSpot:(CGPoint *)arg2;
- (CUIThemeRendition *)renditionNameForKeyList:(struct _renditionkeytoken *)arg1;
- (CUIThemeRendition *)renditionWithKey:(const struct _renditionkeytoken *)arg1;
- (CUIThemeRendition *)renditionWithKey:(const struct _renditionkeytoken *)arg1 usingKeySignature:(id)arg2;
- (void)setBundleID:(id)arg1;
- (void)setMainBundle:(BOOL)arg1;
- (void)setThemeIndex:(unsigned long long)arg1;
- (id)store;
- (unsigned long long)themeIndex;
- (CUICommonAssetStorage *)themeStore;
- (BOOL)usesCUISystemThemeRenditionKey;

@end
