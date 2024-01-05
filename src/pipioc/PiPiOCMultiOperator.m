#import "PiPiOCMultiOperator.h"
#import "PiPiOCMultiOperator+Internal.h"

@interface PiPiOCMultiOperator ()

@property (strong, nonatomic) PiPiOCMultiPdfOperatorAdapter* adapter;

@end

@implementation PiPiOCMultiOperator

- (instancetype)initWithAdapter:(PiPiOCMultiPdfOperatorAdapter *)adapter {
    self = [super init];
    
    if (self) {
        self.adapter = adapter;
    }
    
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
