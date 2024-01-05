#import <Foundation/Foundation.h>
#import "PiPiOCPagePdfAdapter.h"

@interface PiPiOCPdfPager : NSObject

- (instancetype) initWithAdapter: (PiPiOCPagePdfAdapter*) adapter;

-(NSData*) merge:(NSArray<NSNumber*>*) indexs;
-(NSArray<NSData*>*) split:(unsigned int) index withInstruction:(NSString*) instruction;


@end
