#ifndef PiPiOCPdfOperator_h
#define PiPiOCPdfOperator_h

#import <Foundation/Foundation.h>
#import <pipi.h>
#import "PiPiOCPdfEditor.h"
#import "PiPiOCPdfPager.h"
#import "PiPiOCPdfFiller.h"

using namespace PiPi;

@interface PiPiOCPdfOperator : NSObject

@property (assign, atomic) BOOL operable;

-(instancetype) initWithData: (NSData*) pdfBytes;

-(PiPiOCPdfEditor*) getEditor;
-(PiPiOCPdfFiller*) getFiller;
-(PiPiOCPdfPager*) getPager;

-(NSData*) finalize;

@end

#endif
