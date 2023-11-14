#import <Foundation/Foundation.h>
#import "PiPiOCPdfOperator.h"
#import "PiPiOCOperatePdfAdapter.h"
#import "PiPiOCPdfPager.h"
#import "PiPiOCPdfEditor.h"
#import "PiPiOCPdfFiller.h"

@interface PiPiOCPdfOperator ()

@property (strong, atomic) PiPiOCOperatePdfAdapter* adapter;
@property (strong, atomic) PiPiOCPdfPager* pager;
@property (strong, atomic) PiPiOCPdfEditor* editor;
@property (strong, atomic) PiPiOCPdfFiller* filler;

@end

@implementation PiPiOCPdfOperator

- (instancetype)initWithData:(NSData *)pdfBytes {
    self = [super init];
    
    if (self) {
        PiPiOCOperatePdfAdapter* operateAdapter = [[PiPiOCOperatePdfAdapter alloc] initWithData:pdfBytes];
        
        PiPiOCPagePdfAdapter* pageAdapter = [operateAdapter getPageAdapter];
        PiPiOCFillPdfAdapter* fillAdapter = [operateAdapter getFillAdapter];
        PiPiOCEditPdfAdapter* editAdapter = [operateAdapter getEditAdapter];
        
        PiPiOCPdfPager* pager = [[PiPiOCPdfPager alloc] initWithAdapter:pageAdapter];
        PiPiOCPdfEditor* editor = [[PiPiOCPdfEditor alloc] initWithAdapter:editAdapter];
        PiPiOCPdfFiller* filler = [[PiPiOCPdfFiller alloc] initWithAdapter:fillAdapter];
        
        self.adapter = operateAdapter;
        self.pager = pager;
        self.editor = editor;
        self.filler = filler;
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

- (NSData *)finalize {
    return [self.adapter finalize];
}

@end
