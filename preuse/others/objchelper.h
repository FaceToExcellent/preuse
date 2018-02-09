//
//  objchelper.h
//  preuse
//
//  Created by HYZ on 2018/2/9.
//  Copyright © 2018年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface objchelper : NSObject
+ (NSString *)getDevicePlatform;
+ (void)getDeviceTypeAndScreenSize;
+ (void)checkPublicKeyCookie;
+ (NSString *) Decrypt:(NSString *)str;

+(NSString*)datatoStringUTF8:(NSData*)data;
+(NSData*)stringTOData:(NSString*)str;
+(NSDictionary*)jsontoDict:(NSData*)data;
@end
