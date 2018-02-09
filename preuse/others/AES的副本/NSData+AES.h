//
//  NSData+AES.h
//  xbiao
//
//  Created by zhuangzhe on 15/6/1.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (Encryption)

- (NSData *)AES128EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES128DecryptWithKey:(NSString *)key;   //解密

@end