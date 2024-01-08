#import <Foundation/Foundation.h>
#import "PiPiOCPagePdfAdapter.h"
#import "PiPiOCPagePdfAdapter+Internal.h"

@interface PiPiOCPagePdfAdapter ()

@property (assign, atomic) PiPiPager* cPager;

@end

@implementation PiPiOCPagePdfAdapter

- (instancetype)initWithCPager:(PiPiPager *)cPager {
    self = [super init];
    
    if (self) {
        self.cPager = cPager;
    }
    
    return self;
}

- (NSData *)merge:(NSArray<NSNumber*> *)indexs {
    try {
        PiPiPager* cPager = self.cPager;
        
        std::vector<size_t>* cIndexs = new std::vector<size_t>();
        std::vector<char>* cNewPdf;
        
        for (NSNumber* index in indexs) {
            size_t cIndex = [index unsignedLongValue];
            cIndexs->push_back(cIndex);
        }
        
        cPager->Merge(cIndexs, &cNewPdf);
        
        delete cIndexs;
        
        size_t cNewPdfSize = cNewPdf->size();
        char* cNewPdfBytes = new char[cNewPdfSize];
        for (size_t i = 0; i < cNewPdfSize; i++) {
            *(cNewPdfBytes + i) = cNewPdf->at(i);
        }

        NSData* data = [NSData dataWithBytes:cNewPdfBytes length:cNewPdfSize];
        
        return data;
    } catch (PiPiPageException& e) {
        PiPiPageException::PiPiPageExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCPageExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (std::exception& e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCPagePdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (NSArray<NSData *> *)split:(unsigned int)index withInstruction:(NSString *)instruction {
    try {
        PiPiPager* cPager = self.cPager;
        
        std::string cInstruction = std::string([instruction UTF8String]);
        std::vector<std::vector<char>*>* cNewPdfs;
        
        cPager->Split(index, cInstruction, &cNewPdfs);
        
        NSMutableArray* mutableNewPdfs = [[NSMutableArray alloc] init];
        for (auto iterator = cNewPdfs->begin(); iterator != cNewPdfs->end(); iterator.operator++()) {
            std::vector<char>* cNewPdf = *iterator;
            
            size_t cNewPdfSize = cNewPdf->size();
            char* cNewPdfBytes = new char[cNewPdfSize];
            for (size_t i = 0; i < cNewPdfSize; i++) {
                *(cNewPdfBytes + i) = cNewPdf->at(i);
            }
            
            NSData* newPdf = [NSData dataWithBytes:cNewPdfBytes length:cNewPdfSize];
            
            [mutableNewPdfs addObject:newPdf];
            
            delete cNewPdf;
        }
        
        delete cNewPdfs;
        
        NSArray<NSData*>* newPdfs = [[NSArray alloc] initWithArray:mutableNewPdfs];
        
        return newPdfs;
    } catch (PiPiPageException& e) {
        PiPiPageException::PiPiPageExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCPageExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (std::exception& e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCPagePdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

@end
