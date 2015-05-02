//
//  Encrypt.h
//  JWTExample
//
//  Created by xiangyu on 5/2/15.
//  Copyright (c) 2015 MMClub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encrypt : NSObject

+(NSString *)helloStr;
+(NSString *)encrptWithSHA256: (NSString *)rawString key: (NSString *)key;

@end
