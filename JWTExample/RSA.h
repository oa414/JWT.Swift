//
//  RSA.h
//  My
//
//  Created by ideawu on 15-2-3.
//  Copyright (c) 2015年 ideawu. All rights reserved.
//

//http://www.ideawu.com/blog/post/132.html

#import <Foundation/Foundation.h>

@interface RSA : NSObject

+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
+ (NSString *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;

@end