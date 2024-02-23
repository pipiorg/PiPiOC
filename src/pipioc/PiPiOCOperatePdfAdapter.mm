#import <Foundation/Foundation.h>
#import <pipi.h>
#import "PiPiOCOperatePdfAdapter.h"
#import "PiPiOCOperatePdfAdapter+Internal.h"
#import "PiPiOCFillPdfAdapter+Internal.h"
#import "PiPiOCEditPdfAdapter+Internal.h"
#import "PiPiOCExtractPdfAdapter+Internal.h"
#import "PiPiOCFontRegisterAdapter+Internal.h"

using namespace PiPi;

@interface PiPiOCOperatePdfAdapter ()

@property (assign, atomic) BOOL multiManaged;

@property (assign, atomic) PiPiOperator* cOperator;

@property (strong, atomic) PiPiOCEditPdfAdapter* editAdapter;
@property (strong, atomic) PiPiOCFillPdfAdapter* fillAdapter;
@property (strong, atomic) PiPiOCExtractPdfAdapter* extractAdapter;
@property (strong, atomic) PiPiOCFontRegisterAdapter* fontRegisterAdapter;

@end

@implementation PiPiOCOperatePdfAdapter

- (void)dealloc {
    if (!self.multiManaged) {
        if (self.cOperator) {
            delete self.cOperator;
            self.cOperator = NULL;
        }
    }
}

- (instancetype)initWithCOperator:(PiPiOperator *)cOperator {
    self = [super init];
    
    if (self) {
        try {
            PiPiEditor* cEditor = cOperator->GetEditor();
            PiPiFiller* cFiller = cOperator->GetFiller();
            PiPiExtractor* cExtractor = cOperator->GetExtractor();
            PiPiFontRegister* cFontRegister = cOperator->GetFontRegister();
            
            PiPiOCEditPdfAdapter* editAdapter = [[PiPiOCEditPdfAdapter alloc] initWithCEditor:cEditor];
            PiPiOCFillPdfAdapter* fillAdapter = [[PiPiOCFillPdfAdapter alloc] initWithFiller:cFiller];
            PiPiOCExtractPdfAdapter* extractAdapter = [[PiPiOCExtractPdfAdapter alloc] initWithCExtractor:cExtractor];
            PiPiOCFontRegisterAdapter* fontRegisterAdapter = [[PiPiOCFontRegisterAdapter alloc] initWithCFontRegister:cFontRegister];
            
            self.cOperator = cOperator;
            self.fillAdapter = fillAdapter;
            self.editAdapter = editAdapter;
            self.extractAdapter = extractAdapter;
            self.fontRegisterAdapter = fontRegisterAdapter;
            
            self.multiManaged = YES;
        } catch (PiPiFieldCompatibilityException& e) {
            PiPiFieldCompatibilityException::PiPiFieldCompatibilityExceptionCode cCode = e.getCode();
            
            const char* cReason = e.what();
            NSString* reason = [NSString stringWithUTF8String:cReason];
            
            @throw [NSException exceptionWithName:PiPiOCFieldCompatibilityExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
        } catch (std::exception& e) {
            const char* cReason = e.what();
            NSString* reason = [NSString stringWithUTF8String:cReason];
            
            @throw [NSException exceptionWithName:PiPiOCOperatePdfUnknownExceptionName reason:reason userInfo:nil];
        }
    }

    return self;
}

- (instancetype) initWithData:(NSData *)pdfBytes {
    self = [super init];
    
    if (self) {
        try {
            size_t cPdfSize = [pdfBytes length];
            char* cPdfBytes = (char *)[pdfBytes bytes];
            
            PiPiOperator* cOperator = new PiPiOperator(cPdfBytes, cPdfSize);
            PiPiEditor* cEditor = cOperator->GetEditor();
            PiPiFiller* cFiller = cOperator->GetFiller();
            PiPiExtractor* cExtractor = cOperator->GetExtractor();
            PiPiFontRegister* cFontRegister = cOperator->GetFontRegister();
            
            PiPiOCEditPdfAdapter* editAdapter = [[PiPiOCEditPdfAdapter alloc] initWithCEditor:cEditor];
            PiPiOCFillPdfAdapter* fillAdapter = [[PiPiOCFillPdfAdapter alloc] initWithFiller:cFiller];
            PiPiOCExtractPdfAdapter* extractAdapter = [[PiPiOCExtractPdfAdapter alloc] initWithCExtractor:cExtractor];
            PiPiOCFontRegisterAdapter* fontRegisterAdapter = [[PiPiOCFontRegisterAdapter alloc] initWithCFontRegister:cFontRegister];
            
            self.cOperator = cOperator;
            self.fillAdapter = fillAdapter;
            self.editAdapter = editAdapter;
            self.extractAdapter = extractAdapter;
            self.fontRegisterAdapter = fontRegisterAdapter;
            
            self.multiManaged = NO;
        } catch (PiPiFieldCompatibilityException& e) {
            PiPiFieldCompatibilityException::PiPiFieldCompatibilityExceptionCode cCode = e.getCode();
            
            const char* cReason = e.what();
            NSString* reason = [NSString stringWithUTF8String:cReason];
            
            @throw [NSException exceptionWithName:PiPiOCFieldCompatibilityExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
        } catch (std::exception& e) {
            const char* cReason = e.what();
            NSString* reason = [NSString stringWithUTF8String:cReason];
            
            @throw [NSException exceptionWithName:PiPiOCOperatePdfUnknownExceptionName reason:reason userInfo:nil];
        }
    }

    return self;
}

- (BOOL)isOperable {
    if (!self.cOperator) {
        return NO;
    }
    
    return self.cOperator->IsOperable();
}

- (NSData *)finalize {
    try {
        std::vector<char>* cDPdfBytes = new std::vector<char>();
        self.cOperator->Finalize(&cDPdfBytes);
        
        size_t cPdfSize = cDPdfBytes->size();
        char* cPdfBytes = new char[cPdfSize];
        for (size_t i = 0; i < cPdfSize; i++) {
            *(cPdfBytes + i) = cDPdfBytes->at(i);
        }
        
        NSData* pdfBytes = [NSData dataWithBytes:cPdfBytes length:cPdfSize];
        
        return pdfBytes;
    } catch (PiPiManageAppearanceException& e) {
        PiPiManageAppearanceException::PiPiManageAppearanceExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCAppearanceExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (std::exception& e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCOperatePdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)getEditAdapter {
    return self.editAdapter;
}

- (PiPiOCFillPdfAdapter *)getFillAdapter {
    return self.fillAdapter;
}

- (PiPiOCExtractPdfAdapter *)getExtractAdapter {
    return self.extractAdapter;
}

- (PiPiOCFontRegisterAdapter *)getFontRegisterAdapter {
    return self.fontRegisterAdapter;
}

@end
