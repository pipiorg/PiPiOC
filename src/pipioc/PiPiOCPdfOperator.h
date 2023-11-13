#ifndef PiPiOCPdfOperator_h
#define PiPiOCPdfOperator_h

#import <Foundation/Foundation.h>
#import "PiPiOCPdfEditor.h"
#import "PiPiOCPdfPager.h"
#import "PiPiOCPdfFiller.h"

@interface PiPiOCPdfOperator : NSObject

-(instancetype) initWithData: (NSData*) pdfBytes;

-(BOOL)isOperable;

-(PiPiOCPdfEditor*) getEditor;
-(PiPiOCPdfFiller*) getFiller;
-(PiPiOCPdfPager*) getPager;

-(NSData*) finalize;

@end

#endif
