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
    
    return self.cEditor->IsOperable();
}

- (void)dealloc {
    if (self.cEditor) {
        delete self.cEditor;
        self.cEditor = NULL;
    }
}

- (instancetype)initWithCEditor:(PiPiEditor *)cEditor {
    self = [super init];
    
    if (self) {
        self.cEditor = cEditor;
    }
    
    return self;
}

- (PiPiOCEditPdfAdapter*)flatten {
    return [self handleException:^id{
        self.cEditor->Flatten();
        return self;
    }];
}

- (PiPiOCEditPdfAdapter*)flatten:(NSString *)fieldName {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->Flatten(cFieldName);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter*)removeField:(NSString *)fieldName {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->RemoveField(cFieldName);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->RemoveField(cFieldName, pageIndex);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex atX:(double)x atY:(double)y {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->RemoveField(cFieldName, pageIndex, x, y);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)removeField:(NSString *)fieldName atPage:(long)pageIndex atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->RemoveField(cFieldName, pageIndex, x, y, width, height);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter*)renameField:(NSString *)oldFieldName to:(NSString *)newFieldName {
    return [self handleException:^id{
        std::string cOldFieldName = std::string([oldFieldName UTF8String]);
        std::string cNewFieldName = std::string([newFieldName UTF8String]);
        self.cEditor->RenameField(cOldFieldName, cNewFieldName);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter*)addField:(NSString *)fieldName forType:(PiPiOCPdfFieldType)type atPage: (unsigned int) pageIndex atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        
        switch (type) {
            case PiPiOCPdfFieldTypeUnknown:
                break;
            case PiPiOCPdfFieldTypeTextBox:
                self.cEditor->AddField(cFieldName, PiPiFieldType::TextBox, pageIndex, x, y, width, height);
                break;
            case PiPiOCPdfFieldTypeCheckBox:
                self.cEditor->AddField(cFieldName, PiPiFieldType::CheckBox, pageIndex, x, y, width, height);
                break;
        }
        
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withBackgroundColorRed:(float)red withBackgrondColorGreen:(float)green withBackgroundColorBlue:(float)blue {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->SetFieldBackgroundColor(cFieldName, red, green, blue);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withBorderColorRed:(float)red withBorderColorGreen:(float)green withBorderColorBlue:(float)blue {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->SetFieldBorderColor(cFieldName, red, green, blue);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withColorRed:(float)red withColorGreen:(float)green withColorBlue:(float)blue {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->SetFieldColor(cFieldName, red, green, blue);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withTextHorizontalAlignment:(PiPiOCTextHorizontalAlignment)textHorizontalAlignment {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        
        switch (textHorizontalAlignment) {
            case PiPiOCTextHorizontalAlignmentRight:
                self.cEditor->SetFieldTextHorizontalAlignment(cFieldName, PiPiTextHorizontalAlignment::Right);
                break;
            case PiPiOCTextHorizontalAlignmentCenter:
                self.cEditor->SetFieldTextHorizontalAlignment(cFieldName, PiPiTextHorizontalAlignment::Center);
                break;
            default:
                self.cEditor->SetFieldTextHorizontalAlignment(cFieldName, PiPiTextHorizontalAlignment::Left);
                break;
        }
        
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withFontSize:(float)fontSize {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->SetFieldFontSize(cFieldName, fontSize);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withFontName:(NSString *)fontName {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        std::string cFontName = std::string([fontName UTF8String]);
        self.cEditor->SetFieldFontName(cFieldName, cFontName);
        return self;
    }];
}

- (PiPiOCEditPdfAdapter *)setField:(NSString *)fieldName withMultiline:(BOOL)multiline {
    return [self handleException:^id{
        std::string cFieldName = std::string([fieldName UTF8String]);
        self.cEditor->SetFieldMultiline(cFieldName, multiline);
        return self;
    }];
}

- (id) handleException: (id (^)())task {
    try {
        return task();
    } catch (PiPiEditFieldException& e) {
        PiPiEditFieldException::PiPiEditFieldExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditFieldExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (PiPiManageFieldException& e) {
        PiPiManageFieldException::PiPiManageFieldExceptionCode cCode = e.getCode();
        
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCManageFieldExceptionName reason:[NSString stringWithFormat:@"code: %u, %@", cCode, reason] userInfo:nil];
    } catch (std::exception& e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCEditPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

@end
