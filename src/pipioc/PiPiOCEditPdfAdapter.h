#import <Foundation/Foundation.h>
#import "PiPiOCPdfField.h"

@interface PiPiOCEditPdfAdapter : NSObject

- (BOOL) isOperable;
- (void) flatten;
- (void) flatten: (NSString*) fieldName;
- (void) removeField: (NSString*) fieldName;
- (void) renameField: (NSString*) oldFieldName to: (NSString*) newFieldName;
- (void) addField: (NSString*) fieldName forType: (PiPiOCPdfFieldType) type atPage: (unsigned int) page atX: (double) x atY: (double) y withWidth: (double) width withHeight: (double) height;

@end
