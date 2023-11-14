#import <Foundation/Foundation.h>
#import <pipi.h>
#import "PiPiOCOperatePdfAdapter.h"
#import "PiPiOCPagePdfAdapter+Internal.h"
#import "PiPiOCFillPdfAdapter+Internal.h"
#import "PiPiOCEditPdfAdapter+Internal.h"

using namespace PiPi;

@interface PiPiOCOperatePdfAdapter ()

@property (assign, atomic) PiPiOperator* cOperator;

@property (strong, atomic) PiPiOCEditPdfAdapter* editAdapter;
@property (strong, atomic) PiPiOCFillPdfAdapter* fillAdapter;
@property (strong, atomic) PiPiOCPagePdfAdapter* pageAdapter;

@end

@implementation PiPiOCOperatePdfAdapter

- (void)dealloc {
    if (self.cOperator) {
        delete self.cOperator;
        self.cOperator = NULL;
    }
}

- (instancetype) initWithData:(NSData *)pdfBytes {
    self = [super init];
    
    if (self) {
        size_t cPdfSize = [pdfBytes length];
        char* cPdfBytes = (char *)[pdfBytes bytes];
        
        PiPiOperator* cOperator = new PiPiOperator(cPdfBytes, cPdfSize);
        PiPiEditor* cEditor = cOperator->getEditor();
        PiPiPager* cPager = cOperator->getPager();
        PiPiFiller* cFiller = cOperator->getFiller();
        
        PiPiOCPagePdfAdapter* pageAdapter = [[PiPiOCPagePdfAdapter alloc] initWithCPager:cPager];
        PiPiOCEditPdfAdapter* editAdapter = [[PiPiOCEditPdfAdapter alloc] initWithCEditor:cEditor];
        PiPiOCFillPdfAdapter* fillAdapter = [[PiPiOCFillPdfAdapter alloc] initWithFiller:cFiller];
        
        self.cOperator = cOperator;
        self.pageAdapter = pageAdapter;
        self.fillAdapter = fillAdapter;
        self.editAdapter = editAdapter;
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
    char* cPdfBytes;
    size_t cPdfSize;
    self.cOperator->finalize(&cPdfBytes, &cPdfSize);
    
    NSData* pdfBytes = [NSData dataWithBytes:cPdfBytes length:cPdfSize];
    
    delete self.cOperator;
    self.cOperator = NULL;
    
    return pdfBytes;
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

@end