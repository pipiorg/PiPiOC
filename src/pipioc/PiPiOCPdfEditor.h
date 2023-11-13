#ifndef PiPiOCPdfEditor_h
#define PiPiOCPdfEditor_h

#import <Foundation/Foundation.h>

@interface PiPiOCPdfEditor : NSObject

- (BOOL) isOperable;
- (NSString*) flatten: (NSString*) fieldName;

@end

#endif
