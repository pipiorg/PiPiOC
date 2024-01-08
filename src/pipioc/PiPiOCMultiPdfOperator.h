#import <Foundation/Foundation.h>
#import "PiPiOCMultiPdfOperatorAdapter.h"
#import "PiPiOCPdfPager.h"
#import "PiPiOCPdfOperator.h"

@interface PiPiOCMultiPdfOperator : NSObject

- (instancetype) initWithAdapter: (PiPiOCMultiPdfOperatorAdapter*) adapter;
-(PiPiOCPdfOperator*) getOperator: (unsigned int) index;
-(PiPiOCPdfPager*) getPager;

@end