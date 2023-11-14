#import "PiPiOCPdfPager.h"

@interface PiPiOCPdfPager ()

@property (strong, atomic) PiPiOCPagePdfAdapter* adapter;

@end

@implementation PiPiOCPdfPager

- (instancetype)initWithAdapter:(PiPiOCPagePdfAdapter *)adapter {
    self = [super init];
    
    if (self) {
        self.adapter = adapter;
    }
    
    return self;
}

- (BOOL)isOperable {
    return [self.adapter isOperable];
}

@end
