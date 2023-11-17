#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"
#import "PiPiOCPagePdfAdapter.h"
#import "PiPiOCFillPdfAdapter.h"
#import "PiPiOCExtractPdfAdapter.h"

@interface PiPiOCOperatePdfAdapter : NSObject

-(instancetype) initWithData: (NSData*) pdfBytes;

-(BOOL)isOperable;

-(PiPiOCEditPdfAdapter*) getEditAdapter;
-(PiPiOCFillPdfAdapter*) getFillAdapter;
-(PiPiOCPagePdfAdapter*) getPageAdapter;
-(PiPiOCExtractPdfAdapter*) getExtractAdapter;

-(NSData*) finalize;

@end
