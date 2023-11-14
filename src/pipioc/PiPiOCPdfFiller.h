#import <Foundation/Foundation.h>
#import "PiPiOCFillPdfAdapter.h"

@interface PiPiOCPdfFiller : NSObject

- (instancetype) initWithAdapter: (PiPiOCFillPdfAdapter*) adapter;

- (BOOL) isOperable;
- (void) fillImage: (NSString*) fieldName withImage:(NSData*) imageBytes;

@end
