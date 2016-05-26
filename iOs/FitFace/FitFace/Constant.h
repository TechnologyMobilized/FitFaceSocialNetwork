//
//  Constant.h
//  neibr
//
//  Created by Launch Labs on 1/29/15.
//
//

#ifndef neibr_Constant_h
#define neibr_Constant_h

#define isIPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO) //True 4inch
#define IS_OS_9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

//COLORS
#define THEME_COLOR @"3C95F7"
#define HIGHLIGHT @"114895"
#define SEPARATOR_COLOR @"efefef"
#define MENU_TEXT_COLOR @"b5cce3"

//fonts
#define AVENIR_BOOK @"Avenir-Book"
#define AVENIR_HEAVY @"Avenir-Heavy"
#define AVENIR_LIGHT @"Avenir-Light"

#endif
