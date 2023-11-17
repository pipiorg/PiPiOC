#import <Foundation/Foundation.h>
#import "PiPiOCExtractPdfAdapter.h"
#import "PiPiOCPdfPage.h"
#import "PiPiOCPdfField.h"

@interface PiPiOCPdfExtractor : NSObject

- (instancetype) initWithAdapter: (PiPiOCExtractPdfAdapter*) adapter;

- (BOOL) isOperable;

- (NSArray<PiPiOCPdfPage*>*) extractPage;
- (NSArray<PiPiOCPdfField*>*) extractField;

@end
