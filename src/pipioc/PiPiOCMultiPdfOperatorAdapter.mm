#import "PiPiOCMultiPdfOperatorAdapter.h"
#import "PiPiOCMultiPdfOperatorAdapter+Internal.h"
#import "PiPiOCOperatePdfAdapter+Internal.h"
#import "PiPiOCPagePdfAdapter+Internal.h"

@interface PiPiOCMultiPdfOperatorAdapter ()

@property(assign, nonatomic) PiPiMultiOperator* cMultiOp;

@end

@implementation PiPiOCMultiPdfOperatorAdapter

- (instancetype)init {
    self = [super init];
    
    if (self) {
        PiPiMultiOperator* cMultiOp = new PiPiMultiOperator();
        self.cMultiOp = cMultiOp;
    }
    
    return self;
}

- (void)dealloc {
    if (self.cMultiOp) {
        delete self.cMultiOp;
    }
}

- (NSNumber*)add:(NSData *)pdfBytes {
    try {
        size_t cPdfSize = [pdfBytes length];
        char* cPdfBytes = (char *)[pdfBytes bytes];
        
        size_t index = self.cMultiOp->Add(cPdfBytes, cPdfSize);
        
        return [NSNumber numberWithUnsignedLong:index];
    } catch (PiPiFieldCompatibilityException& e) {
        PiPiFieldCompatibilityException::PiPiFieldCompatibilityExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCFieldCompatibilityExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (std::exception& e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCMultiOperatePdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCOperatePdfAdapter *)getOperator:(unsigned int)index {
    try {
        PiPiMultiOperator* cMultiOp = self.cMultiOp;
        PiPiOperator* cOp = cMultiOp->GetOperator(index);
        
        PiPiOCOperatePdfAdapter* opAdapter = [[PiPiOCOperatePdfAdapter alloc] initWithCOperator:cOp];
        
        return opAdapter;
    } catch (PiPiMultiOperateException& e) {
        PiPiMultiOperateException::PiPiMultiOperateExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCMultiOperateExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (std::exception& e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCMultiOperatePdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCPagePdfAdapter *)getPager {
    PiPiMultiOperator* cMultiOp = self.cMultiOp;
    PiPiPager* pager = cMultiOp->GetPager();
    
    PiPiOCPagePdfAdapter* adapter = [[PiPiOCPagePdfAdapter alloc] initWithCPager:pager];
    
    return adapter;
}

@end
