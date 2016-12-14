//
//  OC_Header.h
//  SwiftFrame
//
//  Created by iOSDeveloper on 2016/10/21.
//  Copyright © 2016年 iOSDeveloper. All rights reserved.
//

#ifndef OC_Header_h
#define OC_Header_h
//  屏幕的frame
#define DeviceFrame [UIScreen mainScreen].bounds
//  屏幕的size
#define DeviceSize [UIScreen mainScreen].bounds.size
//  弱引用宏
#define WeakSelf(VC) __weak VC *weakSelf = self
//是否登录过
//#define isLogin @"isLogin"

//  app version
#define APPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//  设备id
#define DeviceId [[[UIDevice currentDevice] identifierForVendor] UUIDString]



//  UUID获取
#define UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]
#define DeviceModel [[UIDevice currentDevice] model]
// url
#define URL(STRING) [NSURL URLWithString:STRING]

//  document路径
#define DocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
//  图片路径
#define ImagesPath [NSString stringWithFormat:@"%@/RuiSaiKe/Images",DocumentPath]

#endif /* OC_Header_h */
