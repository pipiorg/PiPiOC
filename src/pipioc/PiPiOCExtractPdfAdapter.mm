#import <Foundation/Foundation.h>
#import "PiPiOCExtractPdfAdapter.h"
#import "PiPiOCExtractPdfAdapter+Internal.h"

@interface PiPiOCExtractPdfAdapter ()

@property (assign, atomic) PiPiExtractor* cExtractor;

@end

@implementation PiPiOCExtractPdfAdapter

NSString* const PiPiOCExtractPdfUnknownExceptionName = @"PiPiOCExtractPdfUnknownException";

- (instancetype)initWithCExtractor:(PiPiExtractor *)cExtractor {
    self = [super init];
    
    if (self) {
        self.cExtractor = cExtractor;
    }
    
    return self;
}

- (BOOL)isOperable {
    if (!self.cExtractor) {
        return NO;
    }
    
    return self.cExtractor->isOperable();
}

- (NSArray<PiPiOCPdfPage *> *)extractPage {
    try {
        NSMutableArray<PiPiOCPdfPage*>* mutablePages = [[NSMutableArray alloc] init];
        
        std::vector<const PiPiPage*>* cPages = self.cExtractor->extractPage();
        
        for (auto iterator = cPages->begin(); iterator != cPages->end(); iterator.operator++()) {
            const PiPiPage* cPage = *iterator;
            
            double width = cPage->width;
            double height = cPage->height;
            
            PiPiOCPdfPage* page = [[PiPiOCPdfPage alloc] init];
            [page setWidth:width];
            [page setHeight:height];
            
            [mutablePages addObject:page];
        }
        
        delete cPages;
        
        NSArray<PiPiOCPdfPage*>* pages = [[NSArray alloc] initWithArray:mutablePages];
        
        return pages;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCExtractPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

- (NSArray *)extractField {
    try {
        NSMutableArray<PiPiOCPdfField*>* mutableFields = [[NSMutableArray alloc] init];
        
        std::vector<const PiPiField*>* cFields = self.cExtractor->extractField();
        
        for (auto iterator = cFields->begin(); iterator != cFields->end(); iterator.operator++()) {
            const PiPiField* cField = *iterator;
            
            std::string cName = cField->name;
            PiPiFieldType cType = cField->type;
            unsigned int pageIndex = cField->pageIndex;
            double x = cField->x;
            double y = cField->y;
            double width = cField->width;
            double height = cField->height;
            std::string cFontName = cField->fontName;
            float fontSize = cField->fontSize;
            
            NSString* name = [NSString stringWithCString:cName.c_str() encoding:[NSString defaultCStringEncoding]];
            NSString* fontName = [NSString stringWithCString:cFontName.c_str() encoding:[NSString defaultCStringEncoding]];
            
            PiPiOCPdfField* field = [[PiPiOCPdfField alloc] init];
            
            [field setPageIndex:pageIndex];
            [field setX:x];
            [field setY:y];
            [field setWidth:width];
            [field setHeight:height];
            [field setFontName:fontName];
            [field setName:name];
            [field setFontSize:fontSize];
            
            switch (cType) {
                case PiPiFieldType::CheckBox:
                    [field setType:PiPiOCPdfFieldTypeCheckBox];
                    break;
                case PiPiFieldType::TextBox:
                    [field setType:PiPiOCPdfFieldTypeTextBox];
                    break;
                case PiPiFieldType::Unknown:
                    [field setType:PiPiOCPdfFieldTypeUnknown];
                    break;
                default:
                    [field setType:PiPiOCPdfFieldTypeUnknown];
                    break;
            }
            
            [mutableFields addObject:field];
        }
        
        delete cFields;
        
        NSArray<PiPiOCPdfField*>* fields = [[NSArray alloc] initWithArray:mutableFields];
        
        return fields;
    } catch (const std::exception e) {
        const char* cReason = e.what();
        NSString* reason = [NSString stringWithUTF8String:cReason];
        
        @throw [NSException exceptionWithName:PiPiOCExtractPdfUnknownExceptionName reason:reason userInfo:nil];
    }
}

@end
