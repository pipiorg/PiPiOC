#import <Foundation/Foundation.h>

@interface PiPiOCFillPdfAdapter : NSObject

- (BOOL) isOperable;
- (void) fillImage: (NSString*) fieldName withImage:(NSData*) imageBytes;

@end
