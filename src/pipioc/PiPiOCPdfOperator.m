#import <Foundation/Foundation.h>
#import "PiPiOCPdfOperator.h"

@interface PiPiOCPdfOperator ()

@property (strong, atomic) PiPiOCOperatePdfAdapter* adapter;
@property (strong, atomic) PiPiOCPdfPager* pager;
@property (strong, atomic) PiPiOCPdfEditor* editor;
@property (strong, atomic) PiPiOCPdfFiller* filler;
@property (strong, atomic) PiPiOCPdfExtractor* extractor;

@end

@implementation PiPiOCPdfOperator

- (instancetype)initWithData:(NSData *)pdfBytes {
    self = [super init];
    
    if (self) {
        PiPiOCOperatePdfAdapter* operateAdapter = [[PiPiOCOperatePdfAdapter alloc] initWithData:pdfBytes];
        
        PiPiOCPagePdfAdapter* pageAdapter = [operateAdapter getPageAdapter];
        PiPiOCFillPdfAdapter* fillAdapter = [operateAdapter getFillAdapter];
        PiPiOCEditPdfAdapter* editAdapter = [operateAdapter getEditAdapter];
        PiPiOCExtractPdfAdapter* extractAdapter = [operateAdapter getExtractAdapter];
        
        PiPiOCPdfPager* pager = [[PiPiOCPdfPager alloc] initWithAdapter:pageAdapter];
        PiPiOCPdfEditor* editor = [[PiPiOCPdfEditor alloc] initWithAdapter:editAdapter];
        PiPiOCPdfFiller* filler = [[PiPiOCPdfFiller alloc] initWithAdapter:fillAdapter];
        PiPiOCPdfExtractor* extractor = [[PiPiOCPdfExtractor alloc] initWithAdapter:extractAdapter];
        
        self.adapter = operateAdapter;
        self.pager = pager;
        self.editor = editor;
        self.filler = filler;
        self.extractor = extractor;
    }
    
    return self;
}

- (BOOL)isOperable {
    return [self.adapter isOperable];
}

- (PiPiOCPdfPager *)getPager {
    return self.pager;
}

- (PiPiOCPdfEditor *)getEditor {
    return self.editor;
}

- (PiPiOCPdfFiller *)getFiller {
    return self.filler;
}

- (PiPiOCPdfExtractor *)getExtractor {
    return self.extractor;
}

- (NSData *)finalize {
    return [self.adapter finalize];
}

@end
