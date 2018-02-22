//
//  objchelper.m
//  preuse
//
//  Created by HYZ on 2018/2/9.
//  Copyright © 2018年 HYZ. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "objchelper.h"
#include <sys/sysctl.h>
#include <sys/types.h>
#import "SecurityUtil.h"
#import "GTMBase64.h"
#import "NSData+AES.h"
#define MAIN_URL                    @"http://japp.xbiao.com"
#define SYSTEM_VERSION          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define DEVICE_SCREEN_SIZE          [[NSUserDefaults standardUserDefaults] objectForKey:@"ScreenSize"]
#define DEVICE_TYPE                [[NSUserDefaults standardUserDefaults] objectForKey:@"DeviceType"]
#define SHORT_VERSION           [SYSTEM_VERSION stringByReplacingOccurrencesOfString:@"." withString:@"_"]
#define ADDRESS_IP1                 @"" MAIN_URL"/apps/Jewelry/ios-Jewelry"
#define ADDRESS_IP(Url)              \
[NSString stringWithFormat:@"%@-%@-%@-%@%@",ADDRESS_IP1,SHORT_VERSION,DEVICE_TYPE,DEVICE_SCREEN_SIZE,Url]
#define GETPUBLICKEY_URL            ADDRESS_IP(@"/user/publicKey")



@implementation objchelper
+ (NSString *)getDevicePlatform
{
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    return platform;
}
+ (void)getDeviceTypeAndScreenSize
{
    //设备代号
    NSString *platform = [self getDevicePlatform];
    platform = [platform stringByReplacingOccurrencesOfString:@"," withString:@"_"];
    platform = [platform stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    //分辨率
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    
    
    NSString *deviceType;
    NSString *screenSize;
    
    deviceType = platform;
    screenSize = [NSString stringWithFormat:@"%.0f_%.0f",width*scale_screen,height*scale_screen];
    //    NSLog(@"deviceType:%@,screenSize:%@",deviceType,screenSize);
  
    NSUserDefaults *def =[NSUserDefaults standardUserDefaults];
    [def setObject:deviceType forKey:@"DeviceType"];
    [def setObject:screenSize forKey:@"ScreenSize"];
    [def synchronize];
}


+ (void)checkPublicKeyCookie
{
    
    
    //   NSLog(@"%@", SELECTION_ARTICLE_LIST_URL);
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    NSString *publicKey;
    for (NSHTTPCookie *cookie in cookies) {
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"publicKey"]) {
            publicKey = [[cookie properties] objectForKey:@"Value"];
        }
        //        NSLog(@"cookie:%@",cookie);
    }
    if (publicKey.length<16) {
        //因此地方要求同步进行，暂时先写一个request请求，有合适的方法再改善。
        //        NSLog(@"*****没有公钥");
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:GETPUBLICKEY_URL] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
        NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        if (received) {
            NSString *str = [[NSString alloc]initWithData:received encoding:NSUTF8StringEncoding];
            NSLog(@"*****获取公钥成功:%ld",str.length);
        }
        
    }else{
        //        NSLog(@"*****公钥正常");
    }
}


+ (NSString *)getKey
{
    NSString *realKey = @"";
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    NSString *publicKey=@"";
    NSString *userId = @"";
    NSString *userKey = @"";
    for (NSHTTPCookie *cookie in cookies) {
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"publicKey"]) {
            publicKey = [[cookie properties] objectForKey:@"Value"];
        }
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"userid"]) {
            userId = [[cookie properties] objectForKey:@"Value"];
        }
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"userkey"]) {
            userKey = [[cookie properties] objectForKey:@"Value"];
        }
    }
    if (publicKey.length >=16) {
        publicKey = [publicKey stringByRemovingPercentEncoding];
        realKey = [NSString stringWithFormat:@"%@%@",[publicKey substringToIndex:5],[publicKey substringFromIndex:publicKey.length-11]];
//                NSLog(@"publicKey:%@",publicKey);
//                NSLog(@"realKey:%@",realKey);
    }
    return realKey;
}

+ (NSString *)getFontSize
{
    NSString *fontSize;
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    BOOL has = NO;
    for (NSHTTPCookie *cookie in cookies) {
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"fontSize"]) {
            fontSize = [[cookie properties] objectForKey:@"Value"];
            fontSize = [fontSize stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            has = YES;
            break;
        }
    }
    if (!has) {
        [self setFontSize:@"15"];
        fontSize = @"15";
    }
    
    return fontSize;
}
+ (void)setFontSize:(NSString *)fontSize
{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    BOOL has = NO;
    for (NSHTTPCookie *cookie in cookies) {
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"fontSize"]) {
            
            fontSize = [fontSize stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            
            NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithDictionary:cookie.properties];
            
            [properties setValue:fontSize forKey:@"Value"];
            NSHTTPCookie *newCookie = [[NSHTTPCookie alloc] initWithProperties:properties];
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:newCookie];
            has = YES;
            break;
        }
    }
    if (!has) {
        NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithCapacity:0];
        
        fontSize = [fontSize stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        [properties setObject:@"fontSize"               forKey:NSHTTPCookieName];
        [properties setObject:fontSize                  forKey:NSHTTPCookieValue];
        [properties setObject:@".xbiao.com"             forKey:NSHTTPCookieDomain];
        [properties setObject:@"/"                      forKey:NSHTTPCookiePath];
        [properties setObject:@"0"                      forKey:NSHTTPCookieVersion];
        [properties setObject:[[NSDate date] initWithTimeIntervalSinceNow:24*60*60*365]       forKey:NSHTTPCookieExpires];
        
        NSHTTPCookie *newCookie = [[NSHTTPCookie alloc] initWithProperties:properties];;
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:newCookie];
    }
}
+ (void)resetCookieFromName:(NSString *)name toNewValue:(NSString *)value add:(BOOL)isAdd
{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    BOOL has = NO;
    for (NSHTTPCookie *cookie in cookies) {
        //*************************************
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:name]) {
            NSString *str = [[cookie properties] objectForKey:@"Value"];
            str = [str stringByRemovingPercentEncoding];
            if (isAdd) {
                if ([str rangeOfString:value].location == NSNotFound) {
                    str = [str stringByAppendingFormat:@"|%@",value];
                }
            }else
            {
                NSArray *valueArray = [str componentsSeparatedByString:@"|"];
                NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:valueArray];
                
                for (NSString *delStr in valueArray) {
                    if ([delStr isEqualToString:value]) {
                        [mutableArray removeObject:delStr];
                    }
                    
                }
                str = [mutableArray componentsJoinedByString:@"|"];
                //                NSLog(@"str:%@",str);
            }
            
            str = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            
            NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithDictionary:cookie.properties];
            
            [properties setValue:str forKey:@"Value"];
            NSHTTPCookie *newCookie = [[NSHTTPCookie alloc] initWithProperties:properties];
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:newCookie];
            has = YES;
        }
        //**************************************/
        //        NSLog(@"cookie:%@",cookie);
    }
    if (!has&&isAdd) {
        NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithCapacity:0];
        NSString *valueStr = [NSString stringWithFormat:@"0|%@",value];
        valueStr = [valueStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        [properties setObject:name                forKey:NSHTTPCookieName];
        [properties setObject:valueStr            forKey:NSHTTPCookieValue];
        [properties setObject:@".xbiao.com"     forKey:NSHTTPCookieDomain];
        [properties setObject:@"/"                forKey:NSHTTPCookiePath];
        [properties setObject:@"0"                forKey:NSHTTPCookieVersion];
        [properties setObject:[[NSDate date] initWithTimeIntervalSinceNow:24*60*60*1]       forKey:NSHTTPCookieExpires];
        
        NSHTTPCookie *newCookie = [[NSHTTPCookie alloc] initWithProperties:properties];;
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:newCookie];
    }
    //    NSArray *cookiess = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    //    for (NSHTTPCookie *cookie in cookiess) {
    //        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"addContrastTable"]) {
    //             NSLog(@"cookie:%@",cookie);
    //        }
    //
    //    }
    
}
/**
 *  检查是否存在对比中
 *
 *  @param  pid  产品ID
 *
 *  @return  是否
 */
+ (BOOL)contrastTable:(NSString *)pid
{
    BOOL has = NO;
    NSArray *cookiess = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    for (NSHTTPCookie *cookie in cookiess) {
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"addContrastTable"]) {
            NSString *str = [[cookie properties] objectForKey:@"Value"];
            str = [str stringByRemovingPercentEncoding];
            if ([str rangeOfString:pid].location != NSNotFound) {
                has = YES;
            }
        }
        
    }
    return has;
}
+ (NSInteger)contrastCount
{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    NSString *name = @"addContrastTable";
    for (NSHTTPCookie *cookie in cookies) {
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:name]) {
            NSString *str = [[cookie properties] objectForKey:@"Value"];
            str = [str stringByRemovingPercentEncoding];
            NSArray *valueArray = [str componentsSeparatedByString:@"|"];
            NSInteger zero = 0;
            if (valueArray.count > 0) {
                if ([[valueArray objectAtIndex:0] isEqualToString:@"0"]) {
                    zero = 1;
                }
            }
            return valueArray.count-zero;
        }
    }
    return 0;
}
//迭代升级后调用此方法更新公钥
+ (void)delPublicKey
{
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:MAIN_URL]];
    //    NSLog(@"cookies:%@",cookies);
    NSHTTPCookieStorage *cookieJar1 = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in cookies) {
        if ([[[cookie properties] objectForKey:@"Name"]isEqualToString:@"publicKey"]) {
            [cookieJar1 deleteCookie:cookie];
        }
    }
}
//删除cookie
+ (void)userLogoff
{
    NSHTTPCookieStorage *cookieJar1 = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *_tmpArray = [NSArray arrayWithArray:[cookieJar1 cookies]];
    for (NSHTTPCookie *cookie  in _tmpArray) {
        if(![[[cookie properties] objectForKey:@"Name"]isEqualToString:@"publicKey"])
        {
            [cookieJar1 deleteCookie:cookie];
        }
    }
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def removeObjectForKey:@"userInfo"];
    [def removeObjectForKey:@"articleUpdataTime"];
    [def removeObjectForKey:@"postsUpdataTime"];
    [def removeObjectForKey:@"productUpdataTime"];
    [def removeObjectForKey:@"letterUpdataTime"];
    [def synchronize];
    //    NSLog(@"userInfo:%@",[def objectForKey:@"userInfo"]);
    
}

//加密
+(NSString *) Encryption:(NSString *)str
{
    return [SecurityUtil encryptAESData:str app_key:[self getKey]];;
}
//解密
+(NSString *) Decrypt:(NSString *)str
{
    //    NSLog(@"str%@",str);
    NSData *EncryptData = [GTMBase64 decodeString:str];
    //    NSData* EncryptData = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [SecurityUtil decryptAESData:EncryptData app_key:[self getKey]];
}
+(NSString*)datatoStringUTF8:(NSData*)data{
      NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return dataStr;
}
+(NSData*)stringTOData:(NSString*)str{
       NSData* data=[str dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

+(NSDictionary*)jsontoDict:(NSData*)data{
    if (data) {
        id dict=[NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if ([dict isKindOfClass:[NSDictionary class]]) {
            return dict;
        }
    }
    NSDictionary * dict0;
    return dict0;
}
@end
