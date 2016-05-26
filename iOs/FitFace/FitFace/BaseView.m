//
//  BaseView.m
//  neibr
//
//  Created by Launch Labs on 1/29/15.
//
//

#import "BaseView.h"

@implementation BaseView
@synthesize baseViewDelegate = _baseViewDelegate;

#define MIN_RGB_STRING_LENGTH 6
#define RED_VALUE_INDEX 0
#define GREEN_VALUE_INDEX 2
#define BLUE_VALUE_INDEX 4
#define RGB_VALUE_LENGTH 2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)setupLayout{
    
}

+ (UIColor *)colorWithHexString:(NSString *)hex{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 characters
    if ([cString length] < MIN_RGB_STRING_LENGTH){
        return [UIColor grayColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    
    if ([cString length] != MIN_RGB_STRING_LENGTH){
        return  [UIColor grayColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = RED_VALUE_INDEX;
    range.length = RGB_VALUE_LENGTH;
    NSString *rString = [cString substringWithRange:range];
    range.location = GREEN_VALUE_INDEX;
    NSString *gString = [cString substringWithRange:range];
    range.location = BLUE_VALUE_INDEX;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (UIView *)createViewWithRect:(CGRect)rect{
    UIView *container = [[UIView alloc] initWithFrame:rect];
    return container;
}

+ (UIButton *)createButtonWithPath:(NSString *)path withRect:(CGRect)rect{
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:path ofType:nil]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if(rect.size.width <= 0 && rect.size.height <= 0){
        btn.frame = CGRectMake(rect.origin.x, rect.origin.y, image.size.width, image.size.height);
    }
    else {
        btn.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    }
    
    [btn setImage:image forState:UIControlStateNormal];
    btn.exclusiveTouch = YES;
    return btn;
}

+ (UIImageView *)createImageWithPath:(NSString *)path withRect:(CGRect)rect{
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:path ofType:nil]];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)];
    
    if(rect.size.width <= 0 && rect.size.height <= 0){
        imgView.frame = CGRectMake(rect.origin.x, rect.origin.y, image.size.width, image.size.height);
    }
    
    imgView.image = image;
    imgView.clipsToBounds = YES;
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    return imgView;
}

+ (void)fadeObject:(UIView *)object toAlpha:(CGFloat)alpha withDuration:(CGFloat)duration withDelay:(CGFloat)delay withSelector:(SEL)selector forTarget:(id)target withSelectorObject:(id)selObject withSelectorDelay:(CGFloat)selDelay{
    [UIView animateWithDuration:duration delay:delay options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        object.alpha = alpha;
    } completion:^(BOOL finished){
        if(selector){
            [target performSelector:selector withObject:selObject afterDelay:selDelay];
        }
    }];
}

+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (void)moveObject:(UIView*)object toFrame:(CGRect)newFrame withDuration:(CGFloat)duration withDelay:(CGFloat)delay withSelector:(SEL)selector forTarget:(id)target withSelectorObject:(id)selObject withSelectorDelay:(CGFloat)selDelay{
    [UIView animateWithDuration:duration delay:delay options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        object.frame = newFrame;
    } completion:^(BOOL finished){
        if(selector){
            [target performSelector:selector withObject:selObject afterDelay:selDelay];
        }
    }];
}



//snarf method
+ (UIImage*)getLowMemoryVersionOfImage:(UIImage*)image scaledToSize:(CGSize)newSize{ //width x (width/62.5%) ex: 200 x (200*0.625)
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (NSString*)escapeApostrophe:(NSString*)url{
    return [url stringByReplacingOccurrencesOfString:@"\'" withString:@"\'\'" ];
}
+(NSString*)percentEscapeString:(NSString*)unescaped {
    return [self escapeApostrophe:
            [[unescaped stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"%20" withString:@" "]
           ];
}

//+(UIImage*)imageWithImage: (UIImage*) sourceImage scaledToWidth: (float) i_width
//{
//    float oldWidth = sourceImage.size.width;
//    float scaleFactor = i_width / oldWidth;
//    
//    float newHeight = sourceImage.size.height * scaleFactor;
//    float newWidth = oldWidth * scaleFactor;
//    
//    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
//    [sourceImage drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}
//+(UIImage*)scaleImage:(UIImage*)image toImageViewSize:(UIImageView*)imageView{
//    
//    CGFloat widthScale = imageView.bounds.size.width / image.size.width;
//    CGFloat heightScale = imageView.bounds.size.height / image.size.height;
//    
//    CGFloat scaleFactor=1.0;
//    
//    if (imageView.contentMode == UIViewContentModeScaleToFill) {
//        scaleFactor = (widthScale==heightScale) ? widthScale : NAN;
//    }
//    if (imageView.contentMode == UIViewContentModeScaleAspectFit) {
//        scaleFactor = MIN(widthScale, heightScale);
//    }
//    if (imageView.contentMode == UIViewContentModeScaleAspectFill) {
//        scaleFactor= MAX(widthScale, heightScale);
//    }
//    
//    
//    float newHeight = image.size.height * scaleFactor;
//    float newWidth = image.size.width * scaleFactor;
//
//    if(newHeight>image.size.height && newWidth>image.size.width){
//        //no use on scaling if image size is smaller than imageViewSize
//        return image;
//    }
//    else
//        return [self getLowMemoryVersionOfImage:image scaledToSize:CGSizeMake(newWidth, newHeight)];
//    
//}

+ (UIImage*)resizeImageSize:(UIImage*)image scaledToSize:(CGSize)containerSize{ //width x (width/62.5%) ex: 200 x (200*0.625)
    float hfactor = image.size.width / containerSize.width;
    float vfactor = image.size.height / containerSize.height;
    
    float factor = fmax(hfactor, vfactor);
    
    // Divide the size by the greater of the vertical or horizontal shrinkage factor
    float newWidth = image.size.width / factor;
    float newHeight = image.size.height / factor;
    
    // Then figure out if you need to offset it to center vertically or horizontally
    float leftOffset = (containerSize.width - newWidth) / 2;
    float topOffset = (containerSize.height - newHeight) / 2;
    
    CGRect newRect = CGRectMake(leftOffset, topOffset, newWidth, newHeight);
    
    
    UIGraphicsBeginImageContextWithOptions(containerSize, NO, 0.0);
    [image drawInRect:newRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
+ (NSAttributedString*)setCharacterSpacingWithString:(NSString*)str{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attributedStr addAttribute:NSKernAttributeName
                          value:@(1.3)
                          range:NSMakeRange(0, str.length)];
    
    return attributedStr;
}
@end
