#import <Foundation/Foundation.h>
#import "PiPiOCFillPdfAdapter.h"
#import "PiPiOCFillPdfAdapter+Internal.h"

@interface PiPiOCFillPdfAdapter ()

@property (assign, atomic) PiPiFiller* cFiller;

@end

@implementation PiPiOCFillPdfAdapter

- (instancetype)initWithFiller:(PiPiFiller *)cFiller {
    self = [super init];
    
    if (self) {
        self.cFiller = cFiller;
    }
    
    return self;
}

- (BOOL)isOperable {
    if (!self.cFiller) {
        return NO;
    }
    
    return self.cFiller->isOperable();
}

- (PiPiOCFillPdfAdapter*)fill: (NSString*) fieldName withValue: (NSString*)value {
    std::string cFieldName = std::string([fieldName UTF8String]);
    std::string cValue = std::string([value UTF8String]);
    
    self.cFiller->fillValue(cFieldName, cValue);
    
    return self;
}

- (PiPiOCFillPdfAdapter*)fillImage:(NSString *)fieldName withImage:(NSData *)imageBytes {
    char* cImageBytes = (char*) [imageBytes bytes];
    size_t cImageSize = [imageBytes length];
    
    std::string cFieldName = std::string([fieldName UTF8String]);
    
    self.cFiller->fillImage(cFieldName, cImageBytes, cImageSize);
    
    return self;
}

- (PiPiOCFillPdfAdapter*)fill:(NSString *)fieldName withValue:(NSString *)value withEllipsis:(BOOL)ellipsis {
    std::string cFieldName = std::string([fieldName UTF8String]);
    std::string cValue = std::string([value UTF8String]);
    
    self.cFiller->fillValue(cFieldName, cValue, ellipsis);
    
    return self;
}

@end
