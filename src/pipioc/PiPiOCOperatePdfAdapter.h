#ifndef PiPiOCPdfOperator_h
#define PiPiOCPdfOperator_h

#import <Foundation/Foundation.h>
#import "PiPiOCEditPdfAdapter.h"
#import "PiPiOCPagePdfAdapter.h"
#import "PiPiOCFillPdfAdapter.h"

@interface PiPiOCOperatePdfAdapter : NSObject

-(instancetype) initWithData: (NSData*) pdfBytes;

-(BOOL)isOperable;

-(PiPiOCEditPdfAdapter*) getEditAdapter;
-(PiPiOCFillPdfAdapter*) getFillAdapter;
-(PiPiOCPagePdfAdapter*) getPageAdapter;

-(NSData*) finalize;

@end

#endif
