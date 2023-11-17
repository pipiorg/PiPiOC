#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"
#import "PiPiOCEditPdfAdapter+Internal.h"

@interface PiPiOCEditPdfAdapter ()

@property (assign, atomic) PiPiEditor* cEditor;

@end

@implementation PiPiOCEditPdfAdapter

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

- (void)flatten {
    self.cEditor->flatten();
}

- (void)flatten:(NSString *)fieldName {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->flatten(cFieldName);
}

@end
