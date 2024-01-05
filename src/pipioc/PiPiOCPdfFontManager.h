#import <Foundation/Foundation.h>
#import "PiPiOCFontManageAdapter.h"
#import "PiPiOCExceptionName.h"

@interface PiPiOCPdfFontManager : NSObject

- (instancetype) initWithAdapter: (PiPiOCFontManageAdapter*) adapter;

- (NSString*) registerFont: (NSData*) fontBytes;

@end
