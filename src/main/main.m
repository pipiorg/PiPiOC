#import <Foundation/Foundation.h>
#import <pipioc.h>

int main() {
    @autoreleasepool {
        NSData* pdfBytes = [NSData dataWithContentsOfFile:@"" options:NSDataReadingUncached error:NULL];
        
        PiPiOCPdfOperator* aOperator = [[PiPiOCPdfOperator alloc] initWithData:pdfBytes];
        PiPiOCPdfEditor* editor = [aOperator getEditor];
        
        [editor flatten:@""];
        
        NSData* outPdfBytes = [aOperator finalize];
        
        [outPdfBytes writeToFile:@"" atomically:YES];
    }
    return 0;
}
