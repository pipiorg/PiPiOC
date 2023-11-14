#ifndef PiPiOCOperator_h
#define PiPiOCOperator_h

#import <Foundation/Foundation.h>
#import "PiPiOCPdfPager.h"
#import "PiPiOCPdfEditor.h"
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
