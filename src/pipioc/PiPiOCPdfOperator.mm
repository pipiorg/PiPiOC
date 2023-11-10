#import <Foundation/Foundation.h>
#import "PiPiOCPdfOperator.h"

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
    
    [super dealloc];
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
        self.operable = YES;
    }

    return self;
}

- (NSData *)finalize {
    [self check];
    
    char* cPdfBytes;
    size_t cPdfSize;
    self.cOperator->finalize(&cPdfBytes, &cPdfSize);
    
    NSData* pdfBytes = [NSData dataWithBytes:cPdfBytes length:cPdfSize];
    
    [self close];
    
    return pdfBytes;
}

- (PiPiOCPdfEditor *)getEditor {
    [self check];
    return self.editor;
}

- (PiPiOCPdfFiller *)getFiller {
    [self check];
    return self.filler;
}

- (PiPiOCPdfPager *)getPager {
    [self check];
    return self.pager;
}

- (void) check {
    if (!self.operable) {
        // TODO: 拋異常
    }
}

- (void) close {
    if (self.operable) {
        delete self.cOperator;
        self.cOperator = NULL;
        self.operable = NO;
    }
}


@end
