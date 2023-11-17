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

- (void)removeFormField:(NSString *)fieldName {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->removeFormField(cFieldName);
}

- (void)renameFormField:(NSString *)oldFieldName to:(NSString *)newFieldName {
    std::string cOldFieldName = std::string([oldFieldName UTF8String]);
    std::string cNewFieldName = std::string([newFieldName UTF8String]);
    self.cEditor->renameFormField(cOldFieldName, cNewFieldName);
}

- (void)addFormField:(NSString *)fieldName forType:(PiPiOCPdfFieldType)type atPage: (unsigned int) page atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    std::string cFieldName = std::string([fieldName UTF8String]);
    
    switch (type) {
        case PiPiOCPdfFieldTypeUnknown:
            return;
        case PiPiOCPdfFieldTypeTextBox:
            self.cEditor->addFormField(cFieldName, PiPiFieldType::TextBox, page, x, y, width, height);
            break;
        case PiPiOCPdfFieldTypeCheckBox:
            self.cEditor->addFormField(cFieldName, PiPiFieldType::CheckBox, page, x, y, width, height);
            break;
    }
}

@end
