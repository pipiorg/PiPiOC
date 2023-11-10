#import "Foundation/Foundation.h"
#import "PiPiOCPdfEditor.h"

@interface PiPiOCPdfEditor ()

@property (assign, atomic) PiPiEditor* cEditor;

@end

@implementation PiPiOCPdfEditor

- (instancetype)initWithCEditor:(PiPiEditor *)cEditor {
    self = [super init];
    
    if (self) {
        self.cEditor = cEditor;
    }
    
    return self;
}

- (NSString *)flatten:(NSString *)fieldName {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->flatten(cFieldName);
}

@end
