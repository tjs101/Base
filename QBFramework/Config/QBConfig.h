//
//  QBConfig.h
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#ifndef Base_QBConfig_h
#define Base_QBConfig_h

#import "QBLabel.h"

//Log
#if DEBUG
    #define NSLog(format, ...) NSLog(@"\n文件: %@ \n方法: %s \n内容: %@ \n行数: %d",[[[NSString stringWithFormat:@"%s",__FILE__] componentsSeparatedByString:@"/"] lastObject], __FUNCTION__,[NSString stringWithFormat:format, ##__VA_ARGS__],__LINE__);
#else
    #define NSLog(format,...)
#endif


#define ADD_BACK(back)  do {\
                            UIButton  *backButton = [UIButton buttonWithType:UIButtonTypeCustom];\
                            [backButton setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];\
                            [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];\
                             [backButton sizeToFit];\
                            backButton.frame = CGRectMake(0, 0, kButtonLargeSize, kButtonLargeSize);\
                            UIBarButtonItem  *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];\
                            self.navigationItem.leftBarButtonItem = leftItem;\
                        } while(0)


#define SET_NAVIGATION_TITLE(title)     do {\
                QBLabel  *titleLabel = [[QBLabel alloc] init];\
                titleLabel.text = title;\
                titleLabel.textColor = [UIColor redColor];\
                [titleLabel sizeToFit];\
                self.navigationItem.titleView = titleLabel;\
            } while(0)


//color
#define colorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define colorFromRGBA(rgbValue,trans) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:trans]

//NSLocalizedString
#define  LSTR(str)  NSLocalizedString(str, nil)


#ifdef  __IPHONE_7_0
    #define  QBTextAlignmentCenter  NSTextAlignmentCenter
    #define  QBTextAlignmentLeft  NSTextAlignmentLeft
    #define  QBTextAlignmentRight  NSTextAlignmentRight
#else
    #define  QBTextAlignmentCenter  UITextAlignmentCenter
    #define  QBTextAlignmentLeft  UITextAlignmentLeft
    #define  QBTextAlignmentRight  UITextAlignmentRight
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    #define QB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) \
attributes:@{NSFontAttributeName:font} context:nil].size : CGSizeZero;
#else
    #define QB_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text \
sizeWithFont:font constrainedToSize:maxSize lineBreakMode:mode] : CGSizeZero;
#endif

#endif
