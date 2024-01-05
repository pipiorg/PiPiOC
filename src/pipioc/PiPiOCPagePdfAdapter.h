#import <Foundation/Foundation.h>
#import "PiPiOCExceptionName.h"

@interface PiPiOCPagePdfAdapter : NSObject

-(NSData*) merge:(NSArray<NSNumber*>*) indexs;
-(NSArray<NSData*>*) split:(unsigned int) index withInstruction:(NSString*) instruction;

@end
