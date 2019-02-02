//
//  JsonAccess.h
//  JsonDataDemo
//
//  Created by nate on 2019/2/1.
//  Copyright © 2019 nate. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JsonAccess;

NS_ASSUME_NONNULL_BEGIN

extern JsonAccess* Json(NSObject *obj);

@interface JsonAccess : NSObject

//类型强转
//JSON/Dictionary    Model
//NSString         NSNumber
//NSNumber         NSString


- (JsonAccess *(^)(NSString *))key;
- (JsonAccess *(^)(NSInteger ))index;

- (nullable NSString *)string;//遇到number类型会强转string
- (nullable NSNumber *)number;//遇到string类型会强转number
- (nullable NSArray *)array;
- (nullable NSDictionary *)dictionary;


//- (JsonAccess *(^)(NSString *))dic;
//- (JsonAccess *(^)(NSString *))string;//number类型会强转string
//- (JsonAccess *(^)(NSString *))number;//string类型会强转number
//- (JsonAccess *(^)(NSString *))array;
//
//- (JsonAccess *(^)(NSInteger ))dicIdx;
//- (JsonAccess *(^)(NSInteger ))stringIdx;//number类型会强转string
//- (JsonAccess *(^)(NSInteger ))numberIdx;//string类型会强转number
//- (JsonAccess *(^)(NSInteger ))arrayIdx;

@end

NS_ASSUME_NONNULL_END
