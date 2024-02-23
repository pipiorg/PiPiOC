#import "PiPiOCPdfFontRegister.h"
#import "PiPiOCFontRegisterAdapter.h"

@interface PiPiOCPdfFontRegister ()

@property (strong, nonatomic) PiPiOCFontRegisterAdapter* adapter;

@end

@implementation PiPiOCPdfFontRegister

- (instancetype)initWithAdapter:(PiPiOCFontRegisterAdapter *)adapter {
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
