#import <Foundation/Foundation.h>
#import "PiPiOCOperatePdfAdapter.h"
#import "PiPiOCPagePdfAdapter.h"
#import "PiPiOCExceptionName.h"

@interface PiPiOCMultiPdfOperatorAdapter : NSObject

-(instancetype) init;

-(NSNumber*)add: (NSData*) pdfBytes;

-(PiPiOCOperatePdfAdapter*) getOperator: (NSNumber*) index;
-(PiPiOCPagePdfAdapter*) getPager;

@end
