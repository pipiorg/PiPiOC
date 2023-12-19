#import <Foundation/Foundation.h>
#import "PiPiOCFontManageAdapter.h"

@interface PiPiOCPdfFontManager : NSObject

- (instancetype) initWithAdapter: (PiPiOCFontManageAdapter*) adapter;

- (NSString*) registerFont: (NSData*) fontBytes;

@end
