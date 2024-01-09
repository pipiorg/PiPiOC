#import <Foundation/Foundation.h>
#import "PiPiOCExceptionName.h"

@interface PiPiOCPagePdfAdapter : NSObject

-(BOOL) isOperable;

-(NSData*) merge:(NSArray<NSNumber*>*) indexs;
-(NSArray<NSData*>*) split:(NSNumber*) index withInstruction:(NSString*) instruction;

@end
