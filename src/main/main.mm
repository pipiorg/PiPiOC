#import <Foundation/Foundation.h>
#import <pipioc.h>

int main() {
    @autoreleasepool {
        NSData* pdfBytes = [NSData dataWithContentsOfFile:@"" options:NSDataReadingUncached error:NULL];
        
        PiPiOCPdfOperator* aOperator = [[PiPiOCPdfOperator alloc] initWithData:pdfBytes];
        PiPiOCPdfEditor* editor = [aOperator getEditor];
        PiPiOCPdfFiller* filler = [aOperator getFiller];
        PiPiOCPdfExtractor* extractor = [aOperator getExtractor];
        PiPiOCPdfPager* pager = [aOperator getPager];
        
        NSData* outPdfBytes = [aOperator finalize];
        
        [outPdfBytes writeToFile:@"" atomically:YES];
        
        PiPiOCPdfOperator* aOperator2 = [[PiPiOCPdfOperator alloc] initWithData:outPdfBytes];
    }
    return 0;
}
