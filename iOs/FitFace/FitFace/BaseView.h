//
//  BaseView.h
//  neibr
//
//  Created by Launch Labs on 1/29/15.
//
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@protocol BaseViewDelegate;

@interface BaseView : UIView

@property (nonatomic, strong) id <BaseViewDelegate> baseViewDelegate;

- (void) setupLayout;
+ (UIColor *)colorWithHexString:(NSString *)hex;
+ (UIImageView *)createImageWithPath:(NSString *)path withRect:(CGRect)rect;
+ (UIButton *)createButtonWithPath:(NSString *)path withRect:(CGRect)rect;
+ (UIView *)createViewWithRect:(CGRect)rect;
+ (UIImage *)imageFromColor:(UIColor *)color;
+ (void)fadeObject:(UIView *)object toAlpha:(CGFloat)alpha withDuration:(CGFloat)duration withDelay:(CGFloat)delay withSelector:(SEL)selector forTarget:(id)target withSelectorObject:(id)selObject withSelectorDelay:(CGFloat)selDelay;
+ (void)moveObject:(UIView*)object toFrame:(CGRect)newFrame withDuration:(CGFloat)duration withDelay:(CGFloat)delay withSelector:(SEL)selector forTarget:(id)target withSelectorObject:(id)selObject withSelectorDelay:(CGFloat)selDelay;

+ (UIImage*)getLowMemoryVersionOfImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+(NSString*)percentEscapeString:(NSString*)unescaped ;
+ (UIImage*)resizeImageSize:(UIImage*)image scaledToSize:(CGSize)containerSize;
+ (NSAttributedString*)setCharacterSpacingWithString:(NSString*)str;
@end

@protocol BaseViewDelegate <NSObject>

@end