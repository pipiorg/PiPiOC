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

- (void)removeField:(NSString *)fieldName {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->removeField(cFieldName);
}

- (void)renameField:(NSString *)oldFieldName to:(NSString *)newFieldName {
    std::string cOldFieldName = std::string([oldFieldName UTF8String]);
    std::string cNewFieldName = std::string([newFieldName UTF8String]);
    self.cEditor->renameField(cOldFieldName, cNewFieldName);
}

- (void)addField:(NSString *)fieldName forType:(PiPiOCPdfFieldType)type atPage: (unsigned int) page atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    std::string cFieldName = std::string([fieldName UTF8String]);
    
    switch (type) {
        case PiPiOCPdfFieldTypeUnknown:
            return;
        case PiPiOCPdfFieldTypeTextBox:
            self.cEditor->addField(cFieldName, PiPiFieldType::TextBox, page, x, y, width, height);
            break;
        case PiPiOCPdfFieldTypeCheckBox:
            self.cEditor->addField(cFieldName, PiPiFieldType::CheckBox, page, x, y, width, height);
            break;
    }
}

@end
