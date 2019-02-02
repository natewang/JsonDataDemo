////
////  NSDictionary+Json.h
////  JsonDataDemo
////
////  Created by nate on 2019/1/31.
////  Copyright © 2019 nate. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//@class JsonAccess;
//
//NS_ASSUME_NONNULL_BEGIN
//
//extern JsonAccess* Json(NSObject *obj);
//
//@interface JsonAccess : NSObject
//
//- (JsonAccess *(^)(NSString *))dic;
//- (JsonAccess *(^)(NSString *))string;
//- (JsonAccess *(^)(NSString *))number;
//- (JsonAccess *(^)(NSString *))array;
//
//- (JsonAccess *(^)(NSInteger ))dicIdx;
//- (JsonAccess *(^)(NSInteger ))stringIdx;
//- (JsonAccess *(^)(NSInteger ))numberIdx;
//- (JsonAccess *(^)(NSInteger ))arrayIdx;
//
//- (nullable NSString *)stringValue;
//- (nullable NSNumber *)numberValue;
//- (nullable NSArray *)arrayValue;
//- (nullable NSDictionary *)dicValue;
//
//@end
//
//@interface NSDictionary (Json)
//
//@property (nonatomic, strong) JsonAccess *ct_json;
//- (NSDictionary *(^)(NSString *))ct_dic;
//- (NSString *(^)(NSString *))ct_string;
//- (NSNumber *(^)(NSString *))ct_number;
//- (NSArray *(^)(NSString *))ct_array;
//
//@end
//
//@interface NSArray (Json)
//
//- (NSDictionary *(^)(NSInteger ))ct_dicIdx;
//- (NSString *(^)(NSInteger ))ct_stringIdx;
//- (NSNumber *(^)(NSInteger ))ct_numberIdx;
//- (NSArray *(^)(NSInteger ))ct_arrayIdx;
//
//@end
//
//NS_ASSUME_NONNULL_END
