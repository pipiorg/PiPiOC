#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"
#import "PiPiOCEditPdfAdapter+Internal.h"

@interface PiPiOCEditPdfAdapter ()

@property (assign, atomic) PiPiEditor* cEditor;

@end

@implementation PiPiOCEditPdfAdapter

NSString* const PiPiOCEditPdfUnknownExceptionName = @"PiPiOCEditPdfUnkownException";

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
    try {
        self.cEditor->flatten();
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter*)flatten:(NSString *)fieldName {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->flatten(cFieldName);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter*)removeField:(NSString *)fieldName {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->removeField(cFieldName);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->removeField(cFieldName, pageIndex);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex atX:(double)x atY:(double)y {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->removeField(cFieldName, pageIndex, x, y);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->removeField(cFieldName, pageIndex, x, y, width, height);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter*)renameField:(NSString *)oldFieldName to:(NSString *)newFieldName {
    try {
        std::string cOldFieldName = std::string([oldFieldName UTF8String]);
        std::string cNewFieldName = std::string([newFieldName UTF8String]);
        self.cEditor->renameField(cOldFieldName, cNewFieldName);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter*)addField:(NSString *)fieldName forType:(PiPiOCPdfFieldType)type atPage: (unsigned int) pageIndex atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    try {
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
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withBackgroundColorRed:(float)red withBackgrondColorGreen:(float)green withBackgroundColorBlue:(float)blue {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->setFieldBackgroundColor(cFieldName, red, green, blue);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withBorderColorRed:(float)red withBorderColorGreen:(float)green withBorderColorBlue:(float)blue {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->setFieldBorderColor(cFieldName, red, green, blue);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withColorRed:(float)red withColorGreen:(float)green withColorBlue:(float)blue {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->setFieldColor(cFieldName, red, green, blue);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withTextHorizontalAlignment:(PiPiOCTextHorizontalAlignment)textHorizontalAlignment {
    try {
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
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withFontSize:(float)fontSize {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->setFieldFontSize(cFieldName, fontSize);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withFontName:(NSString *)fontName {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        std::string cFontName = std::string([fontName UTF8String]);
        self.cEditor->setFieldFontName(cFieldName, cFontName);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withMultiline:(BOOL)multiline {
    try {
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->setFieldMultiline(cFieldName, multiline);
        return self;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

@end
