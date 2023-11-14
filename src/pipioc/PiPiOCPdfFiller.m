#import <Foundation/Foundation.h>
#import "PiPiOCPdfFiller.h"

@interface PiPiOCPdfFiller ()

@property (strong, atomic) PiPiOCFillPdfAdapter* adapter;

@end

@implementation PiPiOCPdfFiller

- (instancetype)initWithAdapter:(PiPiOCFillPdfAdapter *)adapter {
    self = [super init];
    
    if (self) {
        self.adapter = adapter;
    }
    
    return self;
}

- (BOOL)isOperable {
    return [self.adapter isOperable];
}

- (void)fillImage:(NSString *)fieldName withImage:(NSData *)imageBytes {
    [self.adapter fillImage:fieldName withImage:imageBytes];
}

@end
