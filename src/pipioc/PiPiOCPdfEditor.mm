#import <Foundation/Foundation.h>
#import "PiPiOCPdfEditor.h"
#import "PiPiOCPdfEditor+Internal.h"

@interface PiPiOCPdfEditor ()

@property (assign, atomic) PiPiEditor* cEditor;

@end

@implementation PiPiOCPdfEditor

- (BOOL)isOperable {
    if (!self.cEditor) {
        return NO;
    }
    
    return self.cEditor->isOperable();
}

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
