#import <Foundation/Foundation.h>
#import <pipi.h>
#import "PiPiOCPdfOperator.h"
#import "PiPiOCPdfPager+Internal.h"
#import "PiPiOCPdfEditor+Internal.h"
#import "PiPiOCPdfFiller+Internal.h"

using namespace PiPi;

@interface PiPiOCPdfOperator ()

@property (assign, atomic) PiPiOperator* cOperator;

@property (strong, atomic) PiPiOCPdfEditor* editor;
@property (strong, atomic) PiPiOCPdfFiller* filler;
@property (strong, atomic) PiPiOCPdfPager* pager;

@end

@implementation PiPiOCPdfOperator

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
        
        PiPiOCPdfPager* pager = [[PiPiOCPdfPager alloc] initWithCPager:cPager];
        PiPiOCPdfEditor* editor = [[PiPiOCPdfEditor alloc] initWithCEditor:cEditor];
        PiPiOCPdfFiller* filler = [[PiPiOCPdfFiller alloc] initWithFiller:cFiller];
        
        self.cOperator = cOperator;
        self.pager = pager;
        self.filler = filler;
        self.editor = editor;
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

- (PiPiOCPdfEditor *)getEditor {
    return self.editor;
}

- (PiPiOCPdfFiller *)getFiller {
    return self.filler;
}

- (PiPiOCPdfPager *)getPager {
    return self.pager;
}

@end
