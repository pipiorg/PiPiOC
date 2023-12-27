#import <Foundation/Foundation.h>
#import <pipi.h>
#import "PiPiOCOperatePdfAdapter.h"
#import "PiPiOCPagePdfAdapter+Internal.h"
#import "PiPiOCFillPdfAdapter+Internal.h"
#import "PiPiOCEditPdfAdapter+Internal.h"
#import "PiPiOCExtractPdfAdapter+Internal.h"
#import "PiPiOCFontManageAdapter+Internal.h"

using namespace PiPi;

@interface PiPiOCOperatePdfAdapter ()

@property (assign, atomic) PiPiOperator* cOperator;

@property (strong, atomic) PiPiOCEditPdfAdapter* editAdapter;
@property (strong, atomic) PiPiOCFillPdfAdapter* fillAdapter;
@property (strong, atomic) PiPiOCPagePdfAdapter* pageAdapter;
@property (strong, atomic) PiPiOCExtractPdfAdapter* extractAdapter;
@property (strong, atomic) PiPiOCFontManageAdapter* fontManageAdapter;

@end

@implementation PiPiOCOperatePdfAdapter

NSString* const PiPiOCOperatePdfUnknownExceptionName = @"PiPiOCOperatePdfUnknownException";

- (void)dealloc {
    if (self.cOperator) {
        delete self.cOperator;
        self.cOperator = NULL;
    }
    
    [super dealloc];
}

- (instancetype) initWithData:(NSData *)pdfBytes {
    self = [super init];
    
    if (self) {
        try {
            size_t cPdfSize = [pdfBytes length];
            char* cPdfBytes = (char *)[pdfBytes bytes];
            
            PiPiOperator* cOperator = new PiPiOperator(cPdfBytes, cPdfSize);
            PiPiEditor* cEditor = cOperator->getEditor();
            PiPiPager* cPager = cOperator->getPager();
            PiPiFiller* cFiller = cOperator->getFiller();
            PiPiExtractor* cExtractor = cOperator->getExtractor();
            PiPiFontManager* cFontManager = cOperator->getFontManager();
            
            PiPiOCPagePdfAdapter* pageAdapter = [[PiPiOCPagePdfAdapter alloc] initWithCPager:cPager];
            PiPiOCEditPdfAdapter* editAdapter = [[PiPiOCEditPdfAdapter alloc] initWithCEditor:cEditor];
            PiPiOCFillPdfAdapter* fillAdapter = [[PiPiOCFillPdfAdapter alloc] initWithFiller:cFiller];
            PiPiOCExtractPdfAdapter* extractAdapter = [[PiPiOCExtractPdfAdapter alloc] initWithCExtractor:cExtractor];
            PiPiOCFontManageAdapter* fontManageAdapter = [[PiPiOCFontManageAdapter alloc] initWithCFontManager:cFontManager];
            
            self.cOperator = cOperator;
            self.pageAdapter = pageAdapter;
            self.fillAdapter = fillAdapter;
            self.editAdapter = editAdapter;
            self.extractAdapter = extractAdapter;
            self.fontManageAdapter = fontManageAdapter;
        } catch (const std::exception e) {
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
    
    return self.cOperator->isOperable();
}

- (NSData *)finalize {
    try {
        char* cPdfBytes;
        size_t cPdfSize;
        self.cOperator->finalize(&cPdfBytes, &cPdfSize);
        
        NSData* pdfBytes = [NSData dataWithBytes:cPdfBytes length:cPdfSize];
        
        delete self.cOperator;
        self.cOperator = NULL;
        
        return pdfBytes;
    } catch (const std::exception e) {
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

- (PiPiOCPagePdfAdapter *)getPageAdapter {
    return self.pageAdapter;
}

- (PiPiOCExtractPdfAdapter *)getExtractAdapter {
    return self.extractAdapter;
}

- (PiPiOCFontManageAdapter *)getFontManagerAdapter {
    return self.fontManageAdapter;
}

@end
