#ifndef PiPiOCPdfFiller_h
#define PiPiOCPdfFiller_h

#import <Foundation/Foundation.h>
#import <pipi.h>

using namespace PiPi;

@interface PiPiOCPdfFiller : NSObject

- (instancetype) initWithFiller: (PiPiFiller*) cFiller;

- (void) fillImage: (NSString*) fieldName withImage:(NSData*) imageBytes;

@end

#endif
