#import <Foundation/Foundation.h>
#import "PiPiOCPagePdfAdapter.h"

@interface PiPiOCPdfPager : NSObject

- (instancetype) initWithAdapter: (PiPiOCPagePdfAdapter*) adapter;

- (BOOL) isOperable;

@end
