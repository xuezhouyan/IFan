//
//  RCMessageModel.m
//  YxzChatFramework
//
//  Created by 颜学宙 on 2020/8/8.
//  Copyright © 2020 颜学宙. All rights reserved.
//

#import "RCMessageModel.h"

@implementation RCMessageModel
+ (NSString *)getObjectName {
  return @"RoomChat";
}
- (NSData *)encode {
  
  NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
   if (self.senderUserInfo) {
       [dataDict setObject:[self encodeUserInfo:self.senderUserInfo] forKey:@"user"];
   }
    if (self.context) {
        [dataDict setObject:self.context forKey:@"context"];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDict options:kNilOptions error:nil];
  return data;
}

- (void)decodeWithData:(NSData *)data {
  if (data == nil) {
    return;
  }
  NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
  NSDictionary *json = [[NSDictionary alloc] initWithDictionary:dictionary];
    if (json) {
        NSString *context=json[@"context"];
        self.context=context;
        NSDictionary *userinfoDic = dictionary[@"user"];
        [self decodeUserInfo:userinfoDic];
    }
    
}

@end
