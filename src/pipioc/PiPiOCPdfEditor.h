#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"

@interface PiPiOCPdfEditor : NSObject

- (instancetype) initWithAdapter: (PiPiOCEditPdfAdapter*) adapter;

- (BOOL) isOperable;
- (void) flatten;
- (void) flatten: (NSString*) fieldName;
- (void) removeFormField: (NSString*) fieldName;
- (void) renameFormField: (NSString*) oldFieldName to: (NSString*) newFieldName;
- (void) addFormField: (NSString*) fieldName forType: (PiPiOCPdfFieldType) type atPage: (unsigned int) page atX: (double) x atY: (double) y withWidth: (double) width withHeight: (double) height;


@end
