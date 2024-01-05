#import <Foundation/Foundation.h>
#import "PiPiOCPdfPage.h"
#import "PiPiOCPdfField.h"
#import "PiPiOCExceptionName.h"

@interface PiPiOCExtractPdfAdapter : NSObject

- (BOOL) isOperable;

- (NSArray<PiPiOCPdfPage*>*) extractPage;
- (NSArray<PiPiOCPdfField*>*) extractField;

@end
