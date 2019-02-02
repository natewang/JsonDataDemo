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
- (nullable NSNumber *)number;//遇到string类型会强转number,规则同yymodel
- (nullable NSArray *)array;
- (nullable NSDictionary *)dictionary;

//字面量语法支持
// Json(resultJSON)[@"ext"][@"btnList"][0][@"btnTitle"].string

-(JsonAccess *)objectForKeyedSubscript:(NSString *)key;
-(JsonAccess *)objectAtIndexedSubscript:(NSUInteger)idx;
@end

NS_ASSUME_NONNULL_END
