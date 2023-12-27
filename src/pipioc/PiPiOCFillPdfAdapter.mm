#import <Foundation/Foundation.h>
#import "PiPiOCFillPdfAdapter.h"
#import "PiPiOCFillPdfAdapter+Internal.h"

@interface PiPiOCFillPdfAdapter ()

@property (assign, atomic) PiPiFiller* cFiller;

@end

@implementation PiPiOCFillPdfAdapter

NSString* const PiPiOCFillPdfUnknownExceptionName = @"PiPiOCFillPdfUnknownException";

- (instancetype)initWithFiller:(PiPiFiller *)cFiller {
    self = [super init];
    
    if (self) {
        self.cFiller = cFiller;
    }
    
    return self;
}

- (BOOL)isOperable {
    if (!self.cFiller) {
        return NO;
    }
    
    return self.cFiller->isOperable();
}

- (PiPiOCFillPdfAdapter*)fill: (NSString*) fieldName withValue: (NSString*)value {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        std::string cValue = std::string([value UTF8String]);
        
        self.cFiller->fillValue(cFieldName, cValue);
        
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCFillPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCFillPdfAdapter*)fillImage:(NSString *)fieldName withImage:(NSData *)imageBytes {
    try {
        char* cImageBytes = (char*) [imageBytes bytes];
        size_t cImageSize = [imageBytes length];
        
        std::string cFieldName = std::string([fieldName UTF8String]);
        
        self.cFiller->fillImage(cFieldName, cImageBytes, cImageSize);
        
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCFillPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCFillPdfAdapter*)fill:(NSString *)fieldName withValue:(NSString *)value withEllipsis:(BOOL)ellipsis {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        std::string cValue = std::string([value UTF8String]);
        
        self.cFiller->fillValue(cFieldName, cValue, ellipsis);
        
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCFillPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

@end
