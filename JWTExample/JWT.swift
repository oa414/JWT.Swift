//
//  JWT.swift
//  JWTExample
//
//  Created by xiangyu on 5/2/15.
//  Copyright (c) 2015 MMClub. All rights reserved.
//

import Foundation

protocol JWTAlgorithm {
    func encodePlayload(playload : Dictionary<String, String>, secreat: String) -> String;
}


class JWT {
    
    var iss, sub, aud, exp, nbf, iat, jti: String?;
    var typ, cty: String?;
    
    
    
    func encodeDic(Dictionary<String, String>) -> String {
        return "hello"
    }
    
    func encodePlayload(playload : Dictionary<String, String>, secreat: String) -> String {
        return Encrypt.encrptWithSHA256("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9", key: "secret")
    }
    
    func decodePlayload(jwtString: String) -> Dictionary<String, String> {
        var playload = Dictionary<String, String>();
        
        let arr = split(jwtString) {$0 == "."}
        if (arr.count == 3){
            var claimsBase64: String = arr[1];
            let claimsLength = count(claimsBase64)
            let requiredLength = Int(4 * ceil(Double(claimsLength) / 4.0));
            let paddingCount = requiredLength - claimsLength;
            
            claimsBase64 = claimsBase64.stringByReplacingOccurrencesOfString("-", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil);
            claimsBase64 = claimsBase64.stringByReplacingOccurrencesOfString("_", withString: "/", options: NSStringCompareOptions.LiteralSearch, range: nil);
            
            if (paddingCount > 0){
                var padding : String = "".stringByPaddingToLength(paddingCount, withString: "=", startingAtIndex: 0);
                claimsBase64 = claimsBase64 + padding;
            }
            
            let data = NSData(base64EncodedString: claimsBase64, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
            let base64Decoded: NSString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
            let claimsData = base64Decoded as String
            NSLog("%@", claimsData);
            if !claimsData.isEmpty {
                let json = JSON.parse(claimsData);
                NSLog("%@", json.toString(pretty: true));
            }

            return playload;
            
            
            
        }else {
            return playload; //error;
        }
    }
    
//        NSDictionary *payload;
//        NSError *decodeError;
//        NSArray *parts = [jwt componentsSeparatedByString:@"."];
//        if (parts.count == 3) {
//            NSString *claimsBase64 = parts[1];
//            NSInteger claimsLength = claimsBase64.length;
//            NSInteger requiredLength = (4 * ceil((double)claimsLength / 4.0));
//            NSInteger paddingCount = requiredLength - claimsLength;
//            
//            claimsBase64 = [claimsBase64 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
//            claimsBase64 = [claimsBase64 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
//            
//            if (paddingCount > 0) {
//                NSString *padding =
//                    [[NSString string] stringByPaddingToLength:paddingCount
//                        withString:@"=" startingAtIndex:0];
//                claimsBase64 = [claimsBase64 stringByAppendingString:padding];
//            }
//            
//            NSData *claimsData = [[NSData alloc] initWithBase64EncodedString:claimsBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
//            if (claimsData) {
//                payload = [NSJSONSerialization JSONObjectWithData:claimsData options:0 error:&decodeError];
//            } else {
//                decodeError = ErrorWithDescription(@"Invalid id_token claims part. Failed to decode base64");
//            }
//        } else {
//            decodeError = ErrorWithDescription(@"Invalid id_token. Not enough parts  (Required 3 parts)");
//        }
//        if (error) {
//            *error = decodeError;
//        }
//        return payload;
//
//    }
    
    
    

}
