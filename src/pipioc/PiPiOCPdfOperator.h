#import <Foundation/Foundation.h>
#import "PiPiOCOperatePdfAdapter.h"
#import "PiPiOCPdfEditor.h"
#import "PiPiOCPdfFiller.h"
#import "PiPiOCPdfExtractor.h"
#import "PiPiOCPdfFontManager.h"
#import "PiPiOCExceptionName.h"

@interface PiPiOCPdfOperator : NSObject

-(instancetype) initWithData: (NSData*) pdfBytes;

-(BOOL)isOperable;

-(PiPiOCPdfEditor*) getEditor;
-(PiPiOCPdfFiller*) getFiller;
-(PiPiOCPdfExtractor*) getExtractor;
-(PiPiOCPdfFontManager*) getFontManager;

-(NSData*) finalize;

@end
