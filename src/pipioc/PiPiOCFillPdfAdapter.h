#import <Foundation/Foundation.h>
#import "PiPiOCExceptionName.h"

@interface PiPiOCFillPdfAdapter : NSObject

- (BOOL) isOperable;
- (PiPiOCFillPdfAdapter*) fill: (NSString*) fieldName withValue:(NSString*) value;
- (PiPiOCFillPdfAdapter*) fill: (NSString*) fieldName withValue:(NSString*) value withEllipsis: (BOOL) ellipsis;
- (PiPiOCFillPdfAdapter*) fillImage: (NSString*) fieldName withImage:(NSData*) imageBytes;

@end
