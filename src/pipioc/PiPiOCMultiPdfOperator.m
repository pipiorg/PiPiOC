#import "PiPiOCMultiPdfOperator.h"
#import "PiPiOCMultiPdfOperator+Internal.h"

@interface PiPiOCMultiPdfOperator ()

@property (strong, nonatomic) PiPiOCMultiPdfOperatorAdapter* adapter;
@property (strong, nonatomic) PiPiOCPdfPager* pager;

@property (strong, nonatomic) NSMutableArray<PiPiOCPdfOperator*>* operators;
@property (strong, nonatomic) NSMutableDictionary<NSNumber*, NSNumber*>* operatorMap;
@end

@implementation PiPiOCMultiPdfOperator

- (instancetype)init {
    self = [super init];
    
    if (self) {
        PiPiOCMultiPdfOperatorAdapter* adapter = [[PiPiOCMultiPdfOperatorAdapter alloc] init];
        
        PiPiOCPagePdfAdapter* pageAdapter = [self.adapter getPager];
        PiPiOCPdfPager* pager = [[PiPiOCPdfPager alloc] initWithAdapter:pageAdapter];
        

        self.operators = [[NSMutableArray alloc] init];
        self.operatorMap = [[NSMutableDictionary alloc] init];
        self.adapter = adapter;
        self.pager = pager;
    }
    
    return self;
}

- (NSNumber*) add: (NSData*) pdfBytes {
    NSNumber* index = [self.adapter add:pdfBytes];
    NSNumber* opIndex = [self.operators count];
    
    PiPiOCOperatePdfAdapter* opAdapter = [self.adapter getOperator:index];
    PiPiOCPdfOperator* op = [[PiPiOCPdfOperator alloc] initWithAdapter:opAdapter];
    
    [self.operators addObject:op];
    [self.operatorMap setObject:opIndex forKey:index];
    
    return index;
}

- (PiPiOCPdfOperator *)getOperator:(NSNumber*)index {
    NSNumber* opIndex = [self.operatorMap objectForKey:index];
    PiPiOCPdfOperator* op = [self.operators objectAtIndex:[opIndex unsignedIntegerValue]];
    return op;
}

- (PiPiOCPdfPager *)getPager {
    return self.pager;
}

@end
