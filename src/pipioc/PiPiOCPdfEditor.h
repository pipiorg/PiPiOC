#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"

@interface PiPiOCPdfEditor : NSObject

- (instancetype) initWithAdapter: (PiPiOCEditPdfAdapter*) adapter;

- (BOOL) isOperable;

- (PiPiOCPdfEditor*) flatten;
- (PiPiOCPdfEditor*) flatten: (NSString*) fieldName;

- (PiPiOCPdfEditor*) removeField: (NSString*) fieldName;
- (PiPiOCPdfEditor*) removeField: (NSString*) fieldName atPage: (long) pageIndex;
- (PiPiOCEditPdfAdapter*) removeField: (NSString*) fieldName atPage: (long) pageIndex atX: (double) x atY: (double) y;
- (PiPiOCEditPdfAdapter*) removeField: (NSString*) fieldName atPage: (long) pageIndex atX: (double) x atY: (double) y withWidth: (double) width withHeight: (double) height;

- (PiPiOCPdfEditor*) addField: (NSString*) fieldName forType: (PiPiOCPdfFieldType) type atPage: (unsigned int) pageIndex atX: (double) x atY: (double) y withWidth: (double) width withHeight: (double) height;

- (PiPiOCPdfEditor*) renameField: (NSString*) oldFieldName to: (NSString*) newFieldName;

- (PiPiOCPdfEditor*) setField: (NSString*) fieldName withFontName: (NSString*) fontName;
- (PiPiOCPdfEditor*) setField: (NSString*) fieldName withFontSize: (float) fontSize;
- (PiPiOCPdfEditor*) setField: (NSString*) fieldName withTextHorizontalAlignment: (PiPiOCTextHorizontalAlignment) textHorizontalAlignment;
- (PiPiOCPdfEditor*) setField: (NSString*) fieldName withColorRed: (float) red withColorGreen: (float) green withColorBlue: (float) blue;
- (PiPiOCPdfEditor*) setField: (NSString*) fieldName withBackgroundColorRed: (float) red withBackgrondColorGreen: (float) green withBackgroundColorBlue: (float) blue;
- (PiPiOCPdfEditor*) setField: (NSString*) fieldName withBorderColorRed: (float) red withBorderColorGreen: (float) green withBorderColorBlue: (float) blue;
- (PiPiOCPdfEditor*) setField: (NSString*) fieldName withMultiline: (BOOL) multiline;

@end
