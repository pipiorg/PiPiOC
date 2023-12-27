#import "PiPiOCFontManageAdapter.h"
#import "PiPiOCFontManageAdapter+Internal.h"

@interface PiPiOCFontManageAdapter()

@property (assign, nonatomic) PiPiFontManager* cFontManager;

@end

@implementation PiPiOCFontManageAdapter

NSString* const PiPiOCManageFontUnknownExceptionName = @"PiPiOCManageFontUnknownException";

- (instancetype)initWithCFontManager:(PiPiFontManager*)cFontManager {
    self = [super init];
    
    if (self) {
        self.cFontManager = cFontManager;
    }
    
    return self;
}

- (BOOL)isOperable {
    if (!self.cFontManager) {
        return NO;
    }
    
    return self.cFontManager->isOperable();
}

- (NSString*)registerFont:(NSData *)fontBytes {
    try {
        size_t cFontSize = [fontBytes length];
        char* cFontBytes = (char *)[fontBytes bytes];
        
        std::string cFontName = self.cFontManager->registerFont(cFontBytes, cFontSize);
        NSString* fontName = [NSString stringWithCString:cFontName.c_str() encoding:[NSString defaultCStringEncoding]];
        
        return fontName;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCManageFontUnknownExceptionName reason:reason userInfo:nil];
    }
}

@end
