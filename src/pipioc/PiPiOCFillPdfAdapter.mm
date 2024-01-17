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

- (void)dealloc {
    if (self.cFiller) {
        delete self.cFiller;
        self.cFiller = NULL;
    }
}

- (BOOL)isOperable {
    if (!self.cFiller) {
        return NO;
    }
    
    return self.cFiller->IsOperable();
}

- (PiPiOCFillPdfAdapter*)fill: (NSString*) fieldName withValue: (NSString*)value {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        std::string cValue = std::string([value UTF8String]);
        
        self.cFiller->FillValue(cFieldName, cValue);
        
        return self;
    }];
}

- (PiPiOCFillPdfAdapter*)fillImage:(NSString *)fieldName withImage:(NSData *)imageBytes {
    return [self handleException:^id{
        char* cImageBytes = (char*) [imageBytes bytes];
        size_t cImageSize = [imageBytes length];
        
        std::string cFieldName = std::string([fieldName UTF8String]);
        
        self.cFiller->FillImage(cFieldName, cImageBytes, cImageSize);
        
        return self;
    }];
}

- (PiPiOCFillPdfAdapter*)fill:(NSString *)fieldName withValue:(NSString *)value withEllipsis:(BOOL)ellipsis {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        std::string cValue = std::string([value UTF8String]);
        
        self.cFiller->FillValue(cFieldName, cValue, ellipsis);
        
        return self;
    }];
}

- (id) handleException: (id (^)())task {
    try {
        return task();
    } catch (PiPiManageAppearanceException& e) {
        PiPiManageAppearanceException::PiPiManageAppearanceExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCAppearanceExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (PiPiFillFieldException& e) {
        PiPiFillFieldException::PiPiFillFieldExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCFillFieldExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (std::exception& e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

@end
