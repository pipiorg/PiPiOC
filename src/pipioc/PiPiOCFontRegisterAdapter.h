#import <Foundation/Foundation.h>

@interface PiPiOCFontRegisterAdapter : NSObject

- (BOOL)isOperable;

- (NSString*)registerFont: (NSData*) fontBytes;

@end
