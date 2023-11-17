#import <Foundation/Foundation.h>
#import "PiPiOCPdfExtractor.h"

@interface PiPiOCPdfExtractor ()

@property (strong, atomic) PiPiOCExtractPdfAdapter* adapter;

@end

@implementation PiPiOCPdfExtractor

- (instancetype)initWithAdapter:(PiPiOCExtractPdfAdapter *)adapter {
    self = [super init];
    
    if (self) {
        self.adapter = adapter;
    }
    
    return self;
}

- (BOOL)isOperable {
    return [self.adapter isOperable];
}

- (NSArray<PiPiOCPdfPage *> *)extractPage {
    return [self.adapter extractPage];
}

- (NSArray<PiPiOCPdfField *> *)extractField {
    return [self.adapter extractField];
}

@end
