#import <Foundation/Foundation.h>
#import "PiPiOCPdfOperator.h"
#import "PiPiOCPdfOperator+Internal.h"

@interface PiPiOCPdfOperator ()

@property (strong, atomic) PiPiOCOperatePdfAdapter* adapter;
@property (strong, atomic) PiPiOCPdfEditor* editor;
@property (strong, atomic) PiPiOCPdfFiller* filler;
@property (strong, atomic) PiPiOCPdfExtractor* extractor;
@property (strong, atomic) PiPiOCPdfFontManager* fontManager;

@end

@implementation PiPiOCPdfOperator

- (instancetype)initWithAdapter:(PiPiOCOperatePdfAdapter *)operateAdapter {
    self = [super init];
    
    if (self) {
        PiPiOCFillPdfAdapter* fillAdapter = [operateAdapter getFillAdapter];
        PiPiOCEditPdfAdapter* editAdapter = [operateAdapter getEditAdapter];
        PiPiOCExtractPdfAdapter* extractAdapter = [operateAdapter getExtractAdapter];
        PiPiOCFontManageAdapter* fontManageAdapter = [operateAdapter getFontManagerAdapter];
        
        PiPiOCPdfEditor* editor = [[PiPiOCPdfEditor alloc] initWithAdapter:editAdapter];
        PiPiOCPdfFiller* filler = [[PiPiOCPdfFiller alloc] initWithAdapter:fillAdapter];
        PiPiOCPdfExtractor* extractor = [[PiPiOCPdfExtractor alloc] initWithAdapter:extractAdapter];
        PiPiOCPdfFontManager* fontManager = [[PiPiOCPdfFontManager alloc] initWithAdapter:fontManageAdapter];
        
        self.adapter = operateAdapter;
        self.editor = editor;
        self.filler = filler;
        self.extractor = extractor;
        self.fontManager = fontManager;
    }
    
    return self;
}

- (instancetype)initWithData:(NSData *)pdfBytes {
    self = [super init];
    
    if (self) {
        PiPiOCOperatePdfAdapter* operateAdapter = [[PiPiOCOperatePdfAdapter alloc] initWithData:pdfBytes];
        
        PiPiOCFillPdfAdapter* fillAdapter = [operateAdapter getFillAdapter];
        PiPiOCEditPdfAdapter* editAdapter = [operateAdapter getEditAdapter];
        PiPiOCExtractPdfAdapter* extractAdapter = [operateAdapter getExtractAdapter];
        PiPiOCFontManageAdapter* fontManageAdapter = [operateAdapter getFontManagerAdapter];
        
        PiPiOCPdfEditor* editor = [[PiPiOCPdfEditor alloc] initWithAdapter:editAdapter];
        PiPiOCPdfFiller* filler = [[PiPiOCPdfFiller alloc] initWithAdapter:fillAdapter];
        PiPiOCPdfExtractor* extractor = [[PiPiOCPdfExtractor alloc] initWithAdapter:extractAdapter];
        PiPiOCPdfFontManager* fontManager = [[PiPiOCPdfFontManager alloc] initWithAdapter:fontManageAdapter];
        
        self.adapter = operateAdapter;
        self.editor = editor;
        self.filler = filler;
        self.extractor = extractor;
        self.fontManager = fontManager;
    }
    
    return self;
}

- (BOOL)isOperable {
    return [self.adapter isOperable];
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

- (PiPiOCPdfFontManager *)getFontManager {
    return self.fontManager;
}

@end
