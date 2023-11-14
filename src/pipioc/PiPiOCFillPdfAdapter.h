#ifndef PiPiOCPdfFiller_h
#define PiPiOCPdfFiller_h

#import <Foundation/Foundation.h>

@interface PiPiOCFillPdfAdapter : NSObject

- (BOOL) isOperable;
- (void) fillImage: (NSString*) fieldName withImage:(NSData*) imageBytes;

@end

#endif
