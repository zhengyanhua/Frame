//
//  OCUtils.m
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/11/25.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

#import "OCUtils.h"

@implementation OCUtils
+ (NSStringDrawingOptions)stringDrawingOptions{
    return NSStringDrawingTruncatesLastVisibleLine |
    NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
}
@end
