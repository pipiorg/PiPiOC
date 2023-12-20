#import <Foundation/Foundation.h>
#import "PiPiOCPdfEditor.h"

@interface PiPiOCPdfEditor ()

@property (strong, atomic) PiPiOCEditPdfAdapter* adapter;

@end

@implementation PiPiOCPdfEditor

- (instancetype)initWithAdapter:(PiPiOCEditPdfAdapter *)adapter {
    self = [super init];
    
    if (self) {
        self.adapter = adapter;
    }
    
    return self;
}

- (BOOL)isOperable {
    return [self.adapter isOperable];
}

- (PiPiOCPdfEditor*)flatten {
    [self.adapter flatten];
    return self;
}

- (PiPiOCPdfEditor*)flatten:(NSString *)fieldName {
    [self.adapter flatten:fieldName];
    return self;
}

- (PiPiOCPdfEditor*)removeField:(NSString *)fieldName {
    [self.adapter removeField:fieldName];
    return self;
}

- (PiPiOCPdfEditor *)removeField:(NSString *)fieldName atPage:(unsigned int)pageIndex {
    [self.adapter removeField:fieldName atPage:pageIndex];
    return self;
}

- (PiPiOCPdfEditor *)removeField:(NSString *)fieldName atPage:(unsigned int)pageIndex atX:(double)x atY:(double)y {
    [self.adapter removeField:fieldName atPage:pageIndex atX:x atY:y];
    return self;
}

- (PiPiOCPdfEditor *)removeField:(NSString *)fieldName atPage:(unsigned int)pageIndex atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    [self.adapter removeField:fieldName atPage:pageIndex atX:x atY:y withWidth:width withHeight:height];
    return self;
}

- (PiPiOCPdfEditor *)addField:(NSString *)fieldName forType:(PiPiOCPdfFieldType)type atPage:(unsigned int)pageIndex atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    [self.adapter addField:fieldName forType:type atPage:pageIndex atX:x atY:y withWidth:width withHeight:height];
    return self;
}

- (PiPiOCPdfEditor*)renameField:(NSString *)oldFieldName to:(NSString *)newFieldName {
    [self.adapter renameField:oldFieldName to:newFieldName];
    return self;
}

- (PiPiOCPdfEditor*)addField:(NSString *)fieldName forType:(PiPiOCPdfFieldType)type atPage:(unsigned int)page atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    [self.adapter addField:fieldName forType:type atPage:page atX:x atY:y withWidth:width withHeight:height];
    return self;
}

- (PiPiOCPdfEditor *)setField:(NSString *)fieldName withBackgroundColorRed:(float)red withBackgrondColorGreen:(float)green withBackgroundColorBlue:(float)blue {
    [self.adapter setField:fieldName withBackgroundColorRed:red withBackgrondColorGreen:green withBackgroundColorBlue:blue];
    return self;
}

- (PiPiOCPdfEditor *)setField:(NSString *)fieldName withBorderColorRed:(float)red withBorderColorGreen:(float)green withBorderColorBlue:(float)blue {
    [self.adapter setField:fieldName withBorderColorRed:red withBorderColorGreen:green withBorderColorBlue:blue];
    return self;
}

- (PiPiOCPdfEditor *)setField:(NSString *)fieldName withColorRed:(float)red withColorGreen:(float)green withColorBlue:(float)blue {
    [self.adapter setField:fieldName withColorRed:red withColorGreen:green withColorBlue:blue];
    return self;
}

- (PiPiOCPdfEditor *)setField:(NSString *)fieldName withTextHorizontalAlignment:(PiPiOCTextHorizontalAlignment)textHorizontalAlignment {
    [self.adapter setField:fieldName withTextHorizontalAlignment:textHorizontalAlignment];
    return self;
}

- (PiPiOCPdfEditor *)setField:(NSString *)fieldName withFontSize:(float)fontSize {
    [self.adapter setField:fieldName withFontSize:fontSize];
    return self;
}

- (PiPiOCPdfEditor *)setField:(NSString *)fieldName withFontName:(NSString *)fontName {
    [self.adapter setField:fieldName withFontName:fontName];
    return self;
}

- (PiPiOCPdfEditor *)setField:(NSString *)fieldName withMultiline:(BOOL)multiline {
    [self.adapter setField:fieldName withMultiline:multiline];
    return self;
}

@end
