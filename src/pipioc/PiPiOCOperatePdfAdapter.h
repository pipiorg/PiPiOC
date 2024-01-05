#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"
#import "PiPiOCFillPdfAdapter.h"
#import "PiPiOCExtractPdfAdapter.h"
#import "PiPiOCFontManageAdapter.h"

@interface PiPiOCOperatePdfAdapter : NSObject

-(instancetype) initWithData: (NSData*) pdfBytes;

-(BOOL)isOperable;

-(PiPiOCEditPdfAdapter*) getEditAdapter;
-(PiPiOCFillPdfAdapter*) getFillAdapter;
-(PiPiOCExtractPdfAdapter*) getExtractAdapter;
-(PiPiOCFontManageAdapter*) getFontManagerAdapter;

-(NSData*) finalize;

@end
