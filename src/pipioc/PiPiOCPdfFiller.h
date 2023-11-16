#import <Foundation/Foundation.h>
#import "PiPiOCFillPdfAdapter.h"

@interface PiPiOCPdfFiller : NSObject

- (instancetype) initWithAdapter: (PiPiOCFillPdfAdapter*) adapter;

- (BOOL) isOperable;
- (void) fill: (NSString*) fieldName withValue:(NSString*) value;
- (void) fillImage: (NSString*) fieldName withImage:(NSData*) imageBytes;

@end
