#import <Foundation/Foundation.h>
#import <CoreThemeDefinition/CDStructures.h>

@class CUIRenditionKey;

@interface CUICommonAssetStorage : NSObject {
    void * _appearancedb;
    NSDictionary * _appearances;
    void * _bitmapKeydb;
    void * _colordb;
    struct _carextendedMetadata {
        unsigned int x1;
        BOOL x2[256];
        BOOL x3[256];
        BOOL x4[256];
        BOOL x5[256];
    } * _extendedMetadata;
    NSSet * _externalTags;
    void * _facetKeysdb;
    void * _fontdb;
    void * _fontsizedb;
    NSData * _globals;
    unsigned int  _hasAppearanceKey;
    unsigned int  _hasLocalizationKey;
    struct _carheader {
        unsigned int x1;
        unsigned int x2;
        unsigned int x3;
        unsigned int x4;
        unsigned int x5;
        BOOL x6[128];
        BOOL x7[256];
        unsigned char x8[16];
        unsigned int x9;
        unsigned int x10;
        unsigned int x11;
        unsigned int x12;
    } * _header;
    void * _imagedb;
    unsigned int  _isMemoryMapped;
    struct _renditionkeyfmt * _keyfmt;
    struct _renditionkeyattributeindex { 
        unsigned long long keymask; 
        unsigned char keyindices[65]; 
        unsigned int nkeys; 
        unsigned int keylist[29]; 
    }  _keyfmtindex;
    void * _localizationdb;
    id  _renditionInfoCache;
    unsigned short  _renditionInfoCacheLookup;
    unsigned int  _reserved;
    unsigned int  _swap;
}

- (NSArray <CUIRenditionKey *> *)allAssetKeys;
- (NSArray <NSString *> *)allRenditionNames;
- (id)appearances;

@end
