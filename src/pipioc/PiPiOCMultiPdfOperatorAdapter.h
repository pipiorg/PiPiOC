#import <Foundation/Foundation.h>
#import "PiPiOCOperatePdfAdapter.h"
#import "PiPiOCPagePdfAdapter.h"
#import "PiPiOCExceptionName.h"

@interface PiPiOCMultiPdfOperatorAdapter : NSObject

-(instancetype) init;

-(size_t)add: (NSData*) pdfBytes;

-(PiPiOCOperatePdfAdapter*) getOperator: (unsigned int) index;
-(PiPiOCPagePdfAdapter*) getPager;

@end
