#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"
#import "PiPiOCPagePdfAdapter.h"
#import "PiPiOCFillPdfAdapter.h"
#import "PiPiOCExtractPdfAdapter.h"
#import "PiPiOCFontManageAdapter.h"

@interface PiPiOCOperatePdfAdapter : NSObject

-(instancetype) initWithData: (NSData*) pdfBytes;

-(BOOL)isOperable;

-(PiPiOCEditPdfAdapter*) getEditAdapter;
-(PiPiOCFillPdfAdapter*) getFillAdapter;
-(PiPiOCPagePdfAdapter*) getPageAdapter;
-(PiPiOCExtractPdfAdapter*) getExtractAdapter;
-(PiPiOCFontManageAdapter*) getFontManagerAdapter;

-(NSData*) finalize;

@end
