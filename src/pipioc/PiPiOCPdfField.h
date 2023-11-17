#import <Foundation/Foundation.h>

@interface PiPiOCPdfField : NSObject

typedef NS_ENUM(NSInteger, PiPiOCPdfFieldType) {
    PiPiOCPdfFieldTypeUnknown = 0,
    PiPiOCPdfFieldTypeTextBox = 1,
    PiPiOCPdfFieldTypeCheckBox = 2
};

@property (strong, atomic) NSString* name;
@property (assign, atomic) PiPiOCPdfFieldType type;
@property (assign, atomic) unsigned int page;
@property (assign, atomic) double x;
@property (assign, atomic) double y;
@property (assign, atomic) double width;
@property (assign, atomic) double height;
@property (strong, atomic) NSString* font;
@property (assign, atomic) double fontSize;

@end
