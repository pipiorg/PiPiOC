#ifndef PiPiOCPdfEditor_h
#define PiPiOCPdfEditor_h

#import <Foundation/Foundation.h>
#import <pipi.h>

using namespace PiPi;

@interface PiPiOCPdfEditor : NSObject

@property (assign, atomic) BOOL operable;

- (instancetype) initWithCEditor: (PiPiEditor*) cEditor;

- (NSString*) flatten: (NSString*) fieldName;

@end

#endif
