#import <Foundation/Foundation.h>
#import "PiPiOCPagePdfAdapter.h"

@interface PiPiOCPdfPager : NSObject

- (instancetype) initWithAdapter: (PiPiOCPagePdfAdapter*) adapter;

-(NSData*) merge:(NSArray<NSNumber*>*) indexs;
-(NSArray<NSData*>*) split:(NSNumber*) index withInstruction:(NSString*) instruction;


@end
