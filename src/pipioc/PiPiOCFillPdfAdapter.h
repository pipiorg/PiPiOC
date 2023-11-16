#import <Foundation/Foundation.h>

@interface PiPiOCFillPdfAdapter : NSObject

- (BOOL) isOperable;
- (void) fill: (NSString*) fieldName withValue:(NSString*) value;
- (void) fillImage: (NSString*) fieldName withImage:(NSData*) imageBytes;

@end
