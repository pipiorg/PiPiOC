#import <Foundation/Foundation.h>
#import "PiPiOCPdfPager.h"
#import "PiPiOCPdfPager+Internal.h"

@interface PiPiOCPdfPager ()

@property (assign, atomic) PiPiPager* cPager;

@end

@implementation PiPiOCPdfPager

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
