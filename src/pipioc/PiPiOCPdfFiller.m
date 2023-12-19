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

- (PiPiOCPdfFiller*)fill:(NSString*)fieldName withValue:(NSString*)value {
    [self.adapter fill:fieldName withValue:value];
    return self;
}

- (PiPiOCPdfFiller *)fill:(NSString *)fieldName withValue:(NSString *)value withEllipsis:(BOOL)ellipsis {
    [self.adapter fill:fieldName withValue:value withEllipsis:ellipsis];
    return self;
}

- (PiPiOCPdfFiller*)fillImage:(NSString *)fieldName withImage:(NSData *)imageBytes {
    [self.adapter fillImage:fieldName withImage:imageBytes];
    return self;
}

@end
