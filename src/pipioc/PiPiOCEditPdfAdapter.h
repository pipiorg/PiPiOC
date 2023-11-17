#import <Foundation/Foundation.h>

@interface PiPiOCEditPdfAdapter : NSObject

- (BOOL) isOperable;
- (void) flatten;
- (void) flatten: (NSString*) fieldName;

@end
