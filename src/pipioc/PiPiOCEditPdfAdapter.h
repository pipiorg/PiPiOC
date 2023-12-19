#import <Foundation/Foundation.h>
#import "PiPiOCPdfField.h"

@interface PiPiOCEditPdfAdapter : NSObject

- (BOOL) isOperable;

- (PiPiOCEditPdfAdapter*) flatten;
- (PiPiOCEditPdfAdapter*) flatten: (NSString*) fieldName;

- (PiPiOCEditPdfAdapter*) addField: (NSString*) fieldName forType: (PiPiOCPdfFieldType) type atPage: (unsigned int) pageIndex atX: (double) x atY: (double) y withWidth: (double) width withHeight: (double) height;

- (PiPiOCEditPdfAdapter*) removeField: (NSString*) fieldName;
- (PiPiOCEditPdfAdapter*) removeField: (NSString*) fieldName atPage: (unsigned int) pageIndex;
- (PiPiOCEditPdfAdapter*) removeField: (NSString*) fieldName atPage: (unsigned int) pageIndex atX: (double) x atY: (double) y;
- (PiPiOCEditPdfAdapter*) removeField: (NSString*) fieldName atPage: (unsigned int) pageIndex atX: (double) x atY: (double) y withWidth: (double) width withHeight: (double) height;

- (PiPiOCEditPdfAdapter*) renameField: (NSString*) oldFieldName to: (NSString*) newFieldName;

- (PiPiOCEditPdfAdapter*) setField: (NSString*) fieldName withFontName: (NSString*) fontName;
- (PiPiOCEditPdfAdapter*) setField: (NSString*) fieldName withFontSize: (float) fontSize;
- (PiPiOCEditPdfAdapter*) setField: (NSString*) fieldName withTextHorizontalAlignment: (PiPiOCTextHorizontalAlignment) textHorizontalAlignment;
- (PiPiOCEditPdfAdapter*) setField: (NSString*) fieldName withColorRed: (float) red withColorGreen: (float) green withColorBlue: (float) blue;
- (PiPiOCEditPdfAdapter*) setField: (NSString*) fieldName withBackgroundColorRed: (float) red withBackgrondColorGreen: (float) green withBackgroundColorBlue: (float) blue;
- (PiPiOCEditPdfAdapter*) setField: (NSString*) fieldName withBorderColorRed: (float) red withBorderColorGreen: (float) green withBorderColorBlue: (float) blue;
- (PiPiOCEditPdfAdapter*) setField: (NSString*) fieldName withMultiline: (BOOL) multiline;
 
@end
