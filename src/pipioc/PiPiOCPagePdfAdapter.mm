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

- (BOOL)isOperable {
    if (!self.cPager) {
        return NO;
    }
    
    return self.cPager->isOperable();
}

@end
