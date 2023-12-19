#import <Foundation/Foundation.h>

@interface PiPiOCFontManageAdapter : NSObject

- (BOOL)isOperable;

- (NSString*)registerFont: (NSData*) fontBytes;

@end
