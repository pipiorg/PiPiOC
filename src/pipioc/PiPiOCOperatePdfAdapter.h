#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"
#import "PiPiOCFillPdfAdapter.h"
#import "PiPiOCExtractPdfAdapter.h"
#import "PiPiOCFontRegisterAdapter.h"

@interface PiPiOCOperatePdfAdapter : NSObject

-(instancetype) initWithData: (NSData*) pdfBytes;

-(BOOL)isOperable;

-(PiPiOCEditPdfAdapter*) getEditAdapter;
-(PiPiOCFillPdfAdapter*) getFillAdapter;
-(PiPiOCExtractPdfAdapter*) getExtractAdapter;
-(PiPiOCFontRegisterAdapter*) getFontRegisterAdapter;

-(NSData*) finalize;

@end
