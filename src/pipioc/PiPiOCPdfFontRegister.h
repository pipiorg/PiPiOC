#import <Foundation/Foundation.h>
#import "PiPiOCFontRegisterAdapter.h"
#import "PiPiOCExceptionName.h"

@interface PiPiOCPdfFontRegister : NSObject

- (instancetype) initWithAdapter: (PiPiOCFontRegisterAdapter*) adapter;

- (BOOL) isOperable;
- (NSString*) registerFont: (NSData*) fontBytes;

@end
