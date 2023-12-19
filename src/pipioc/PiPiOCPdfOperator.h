#import <Foundation/Foundation.h>
#import "PiPiOCOperatePdfAdapter.h"
#import "PiPiOCPdfPager.h"
#import "PiPiOCPdfEditor.h"
#import "PiPiOCPdfFiller.h"
#import "PiPiOCPdfExtractor.h"
#import "PiPiOCPdfFontManager.h"

@interface PiPiOCPdfOperator : NSObject

-(instancetype) initWithData: (NSData*) pdfBytes;

-(BOOL)isOperable;

-(PiPiOCPdfEditor*) getEditor;
-(PiPiOCPdfFiller*) getFiller;
-(PiPiOCPdfPager*) getPager;
-(PiPiOCPdfExtractor*) getExtractor;
-(PiPiOCPdfFontManager*) getFontManager;

-(NSData*) finalize;

@end
