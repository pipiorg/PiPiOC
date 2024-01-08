#import "PiPiOCMultiPdfOperator.h"
#import "PiPiOCMultiPdfOperator+Internal.h"

@interface PiPiOCMultiPdfOperator ()

@property (strong, nonatomic) PiPiOCMultiPdfOperatorAdapter* adapter;

@end

@implementation PiPiOCMultiPdfOperator

- (instancetype)initWithAdapter:(PiPiOCMultiPdfOperatorAdapter *)adapter {
    self = [super init];
    
    if (self) {
        self.adapter = adapter;
    }
    
    return self;
}

- (PiPiOCMultiPdfOperator*) add: (NSData*) pdfBytes {
    [self.adapter add:pdfBytes];
    return self;
}

- (PiPiOCPdfOperator *)getOperator:(unsigned int)index {
    PiPiOCOperatePdfAdapter* opAdapter = [self.adapter getOperator:index];
    PiPiOCPdfOperator* op = [[PiPiOCPdfOperator alloc] initWithAdapter: opAdapter];
    return op;
}

- (PiPiOCPdfPager *)getPager {
    PiPiOCPagePdfAdapter* pageAdapter = [self.adapter getPager];
    PiPiOCPdfPager* pager = [[PiPiOCPdfPager alloc] initWithAdapter:pageAdapter];
    return pager;
}

@end
