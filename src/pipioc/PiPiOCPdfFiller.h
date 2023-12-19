#import <Foundation/Foundation.h>
#import "PiPiOCFillPdfAdapter.h"

@interface PiPiOCPdfFiller : NSObject

- (instancetype) initWithAdapter: (PiPiOCFillPdfAdapter*) adapter;

- (BOOL) isOperable;
- (PiPiOCPdfFiller*) fill: (NSString*) fieldName withValue:(NSString*) value;
- (PiPiOCPdfFiller*) fill: (NSString*) fieldName withValue:(NSString*) value withEllipsis:(BOOL)ellipsis;
- (PiPiOCPdfFiller*) fillImage: (NSString*) fieldName withImage:(NSData*) imageBytes;

@end
