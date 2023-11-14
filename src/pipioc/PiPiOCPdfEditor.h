#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"

@interface PiPiOCPdfEditor : NSObject

- (instancetype) initWithAdapter: (PiPiOCEditPdfAdapter*) adapter;

- (BOOL) isOperable;
- (void) flatten: (NSString*) fieldName;

@end
