//
//  Encrypt.m
//  JWTExample
//
//  Created by xiangyu on 5/2/15.
//  Copyright (c) 2015 MMClub. All rights reserved.
//

#import "Encrypt.h"
#import <CommonCrypto/CommonCrypto.h>
#import "RSA.h"
@implementation Encrypt


+(NSString *)helloStr{
    return @"hello";
}

+(NSString *)encrptWithSHA256: (NSString *)rawString key: (NSString *)key {
    NSString * parameters = rawString;
    NSString *salt = key;
    NSData *saltData = [salt dataUsingEncoding:NSUTF8StringEncoding];
    NSData *paramData = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* hash = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH ];
    CCHmac(kCCHmacAlgSHA256, saltData.bytes, saltData.length, paramData.bytes, paramData.length, hash.mutableBytes);
    NSString *base64Hash = [hash base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64Hash;
}

+(NSString *)encrptWithSHA512: (NSString *)rawString key: (NSString *)key {
    NSString * parameters = rawString;
    NSString *salt = key;
    NSData *saltData = [salt dataUsingEncoding:NSUTF8StringEncoding];
    NSData *paramData = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* hash = [NSMutableData dataWithLength:CC_SHA512_DIGEST_LENGTH ];
    CCHmac(kCCHmacAlgSHA512, saltData.bytes, saltData.length, paramData.bytes, paramData.length, hash.mutableBytes);
    NSString *base64Hash = [hash base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64Hash;
}

+(NSString *)encrptWithSHA384: (NSString *)rawString key: (NSString *)key {
    NSString * parameters = rawString;
    NSString *salt = key;
    NSData *saltData = [salt dataUsingEncoding:NSUTF8StringEncoding];
    NSData *paramData = [parameters dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableData* hash = [NSMutableData dataWithLength:CC_SHA384_DIGEST_LENGTH ];
    CCHmac(kCCHmacAlgSHA384, saltData.bytes, saltData.length, paramData.bytes, paramData.length, hash.mutableBytes);
    NSString *base64Hash = [hash base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64Hash;
}





@end
