#import <Foundation/Foundation.h>
#import "PiPiOCPdfFiller.h"

@interface PiPiOCPdfFiller ()

@property (assign, atomic) PiPiFiller* cFiller;

@end

@implementation PiPiOCPdfFiller

- (instancetype)initWithFiller:(PiPiFiller *)cFiller {
    self = [super init];
    
    if (self) {
        self.cFiller = cFiller;
    }
    
    return self;
}

- (void)fillImage:(NSString *)fieldName withImage:(NSData *)imageBytes {
    char* cImageBytes = (char*) [imageBytes bytes];
    size_t cImageSize = [imageBytes length];
    
    std::string cFieldName = std::string([fieldName UTF8String]);
    
    self.cFiller->fillImage(cFieldName, cImageBytes, cImageSize);
}

@end
