#import "PiPiOCFontRegisterAdapter.h"
#import "PiPiOCFontRegisterAdapter+Internal.h"

@interface PiPiOCFontRegisterAdapter()

@property (assign, atomic) PiPiFontRegister* cFontRegister;

@end

@implementation PiPiOCFontRegisterAdapter

NSString* const PiPiOCRegisterFontUnknownExceptionName = @"PiPiOCRegisterFontUnknownException";

- (instancetype)initWithCFontRegister:(PiPiFontRegister*)cFontRegister {
    self = [super init];
    
    if (self) {
        self.cFontRegister = cFontRegister;
    }
    
    return self;
}

- (void)dealloc {
    if (self.cFontRegister) {
        delete self.cFontRegister;
        self.cFontRegister = NULL;
    }
}

- (BOOL)isOperable {
    if (!self.cFontRegister) {
        return NO;
    }
    
    return self.cFontRegister->IsOperable();
}

- (NSString*)registerFont:(NSData *)fontBytes {
    try {
        size_t cFontSize = [fontBytes length];
        char* cFontBytes = (char *)[fontBytes bytes];
        
        std::string cFontName = self.cFontRegister->RegisterFont(cFontBytes, cFontSize);
        NSString* fontName = [NSString stringWithCString:cFontName.c_str() encoding:[NSString defaultCStringEncoding]];
        
        return fontName;
    } catch (const std::exception& e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCRegisterFontUnknownExceptionName reason:reason userInfo:nil];
    }
}

@end
