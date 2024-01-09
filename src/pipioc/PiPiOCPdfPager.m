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

- (NSData *)merge:(NSArray<NSNumber *> *)indexs {
    return [self.adapter merge:indexs];
}

- (NSArray<NSData *> *)split:(NSNumber*)index withInstruction:(NSString *)instruction {
    return [self.adapter split:index withInstruction:instruction];
}

@end
