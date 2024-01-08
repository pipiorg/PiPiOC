#import <Foundation/Foundation.h>
#import "PiPiOCMultiPdfOperatorAdapter.h"
#import "PiPiOCPdfPager.h"
#import "PiPiOCPdfOperator.h"

@interface PiPiOCMultiPdfOperator : NSObject

- (instancetype) init;
-(NSNumber*) add: (NSData*) pdfBytes;
-(PiPiOCPdfOperator*) getOperator: (NSNumber*) index;
-(PiPiOCPdfPager*) getPager;

@end
