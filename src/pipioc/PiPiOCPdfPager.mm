#import <Foundation/Foundation.h>
#import "PiPiOCPdfPager.h"

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

@end
