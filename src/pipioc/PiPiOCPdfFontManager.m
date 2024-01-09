#import "PiPiOCPdfFontManager.h"
#import "PiPiOCFontManageAdapter.h"

@interface PiPiOCPdfFontManager ()

@property (strong, nonatomic) PiPiOCFontManageAdapter* adapter;

@end

@implementation PiPiOCPdfFontManager

- (instancetype)initWithAdapter:(PiPiOCFontManageAdapter *)adapter {
    self = [super init];
    
    if (self) {
        self.adapter = adapter;
    }
    
    return self;
}

- (BOOL)isOperable {
    return [self.adapter isOperable];
}

- (NSString*)registerFont:(NSData *)fontBytes {
    return [self.adapter registerFont:fontBytes];
}

@end
