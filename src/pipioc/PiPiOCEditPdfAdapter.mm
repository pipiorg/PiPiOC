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

- (PiPiOCEditPdfAdapter*)flatten {
    self.cEditor->flatten();
    return self;
}

- (PiPiOCEditPdfAdapter*)flatten:(NSString *)fieldName {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->flatten(cFieldName);
    return self;
}

- (PiPiOCEditPdfAdapter*)removeField:(NSString *)fieldName {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->removeField(cFieldName);
    return self;
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->removeField(cFieldName, pageIndex);
    return self;
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex atX:(double)x atY:(double)y {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->removeField(cFieldName, pageIndex, x, y);
    return self;
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->removeField(cFieldName, pageIndex, x, y, width, height);
    return self;
}

- (PiPiOCEditPdfAdapter*)renameField:(NSString *)oldFieldName to:(NSString *)newFieldName {
    std::string cOldFieldName = std::string([oldFieldName UTF8String]);
    std::string cNewFieldName = std::string([newFieldName UTF8String]);
    self.cEditor->renameField(cOldFieldName, cNewFieldName);
    return self;
}

- (PiPiOCEditPdfAdapter*)addField:(NSString *)fieldName forType:(PiPiOCPdfFieldType)type atPage: (unsigned int) pageIndex atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    std::string cFieldName = std::string([fieldName UTF8String]);
    
    switch (type) {
        case PiPiOCPdfFieldTypeUnknown:
            break;
        case PiPiOCPdfFieldTypeTextBox:
            self.cEditor->addField(cFieldName, PiPiFieldType::TextBox, pageIndex, x, y, width, height);
            break;
        case PiPiOCPdfFieldTypeCheckBox:
            self.cEditor->addField(cFieldName, PiPiFieldType::CheckBox, pageIndex, x, y, width, height);
            break;
    }
    
    return self;
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withBackgroundColorRed:(float)red withBackgrondColorGreen:(float)green withBackgroundColorBlue:(float)blue {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->setFieldBackgroundColor(cFieldName, red, green, blue);
    return self;
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withBorderColorRed:(float)red withBorderColorGreen:(float)green withBorderColorBlue:(float)blue {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->setFieldBorderColor(cFieldName, red, green, blue);
    return self;
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withColorRed:(float)red withColorGreen:(float)green withColorBlue:(float)blue {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->setFieldColor(cFieldName, red, green, blue);
    return self;
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withTextHorizontalAlignment:(PiPiOCTextHorizontalAlignment)textHorizontalAlignment {
    std::string cFieldName = std::string([fieldName UTF8String]);
    
    switch (textHorizontalAlignment) {
        case PiPiOCTextHorizontalAlignmentRight:
            self.cEditor->setFieldTextHorizontalAlignment(cFieldName, PiPiTextHorizontalAlignment::Right);
            break;
        case PiPiOCTextHorizontalAlignmentCenter:
            self.cEditor->setFieldTextHorizontalAlignment(cFieldName, PiPiTextHorizontalAlignment::Center);
            break;
        default:
            self.cEditor->setFieldTextHorizontalAlignment(cFieldName, PiPiTextHorizontalAlignment::Left);
            break;
    }
    
    return self;
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withFontSize:(float)fontSize {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->setFieldFontSize(cFieldName, fontSize);
    return self;
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withFontName:(NSString *)fontName {
    std::string cFieldName = std::string([fieldName UTF8String]);
    std::string cFontName = std::string([fontName UTF8String]);
    self.cEditor->setFieldFontName(cFieldName, cFontName);
    return self;
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withMultiline:(BOOL)multiline {
    std::string cFieldName = std::string([fieldName UTF8String]);
    self.cEditor->setFieldMultiline(cFieldName, multiline);
    return self;
}

@end
