#import "PiPiOCMultiPdfOperatorAdapter.h"
#import "PiPiOCMultiPdfOperatorAdapter+Internal.h"
#import "PiPiOCOperatePdfAdapter+Internal.h"
#import "PiPiOCPagePdfAdapter+Internal.h"

@interface PiPiOCMultiPdfOperatorAdapter ()

@property(assign, atomic) PiPiMultiOperator* cMultiOp;

@property (strong, atomic) NSMutableArray<PiPiOCOperatePdfAdapter*>* operatorAdapters;
@property (strong, atomic) NSMutableDictionary<NSNumber*, NSNumber*>* operatorAdapterMap;

@end

@implementation PiPiOCMultiPdfOperatorAdapter

- (instancetype)init {
    self = [super init];
    
    if (self) {
        PiPiMultiOperator* cMultiOp = new PiPiMultiOperator();
        self.cMultiOp = cMultiOp;
        
        self.operatorAdapters = [[NSMutableArray alloc] init];
        self.operatorAdapterMap = [[NSMutableDictionary alloc] init];
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
        
        size_t cIndex = self.cMultiOp->Add(cPdfBytes, cPdfSize);
        
        NSNumber* index = [[NSNumber alloc] initWithUnsignedLong:cIndex];
        NSNumber* opAdapterIndex = [NSNumber numberWithUnsignedInteger:self.operatorAdapters.count];
        
        PiPiOperator* cOp = self.cMultiOp->GetOperator(cIndex);
        PiPiOCOperatePdfAdapter* opAdapter = [[PiPiOCOperatePdfAdapter alloc] initWithCOperator:cOp];
        
        [self.operatorAdapters addObject:opAdapter];
        [self.operatorAdapterMap setObject:opAdapterIndex forKey:index];
        
        return index;
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

- (PiPiOCOperatePdfAdapter *)getOperator:(NSNumber*)index {
    try {
        PiPiMultiOperator* cMultiOp = self.cMultiOp;
        
        NSNumber* opAdapterIndex = [self.operatorAdapterMap objectForKey:index];
        PiPiOCOperatePdfAdapter* opAdapter = [self.operatorAdapters objectAtIndex:[opAdapterIndex unsignedIntegerValue]];
        
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
