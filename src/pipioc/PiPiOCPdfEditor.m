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

- (void)flatten {
    [self.adapter flatten];
}

- (void)flatten:(NSString *)fieldName {
    [self.adapter flatten:fieldName];
}

- (void)removeField:(NSString *)fieldName {
    [self.adapter removeField:fieldName];
}

- (void)renameField:(NSString *)oldFieldName to:(NSString *)newFieldName {
    [self.adapter renameField:oldFieldName to:newFieldName];
}

- (void)addField:(NSString *)fieldName forType:(PiPiOCPdfFieldType)type atPage:(unsigned int)page atX:(double)x atY:(double)y withWidth:(double)width withHeight:(double)height {
    [self.adapter addField:fieldName forType:type atPage:page atX:x atY:y withWidth:width withHeight:height];
}

@end
