#import <Foundation/Foundation.h>
#import "PiPiOCPdfEditor.h"
#import "PiPiOCEditPdfAdapter.h"

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

- (void)flatten:(NSString *)fieldName {
    [self.adapter flatten:fieldName];
}

@end
