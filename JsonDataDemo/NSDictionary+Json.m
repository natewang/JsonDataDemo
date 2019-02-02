////
////  NSDictionary+Json.m
////  JsonDataDemo
////
////  Created by nate on 2019/1/31.
////  Copyright © 2019 nate. All rights reserved.
////
//
//#import "NSDictionary+Json.h"
//
//@interface JsonAccess()
//
//@property (nonatomic, strong) NSObject *data;
//
//@end
//
//JsonAccess* Json(NSObject *obj) {
//
//    JsonAccess *json = [JsonAccess new];
//    json.data = obj;
//
//    return json;
//}
//
//@implementation JsonAccess
//
//- (JsonAccess *(^)(NSString *))dic
//{
//    return ^JsonAccess*(NSString *key) {
//
//        self.data = [self checkValueType:[NSDictionary class] key:key];
//        return self;
//    };
//}
//
//- (JsonAccess *(^)(NSString *))string
//{
//    return ^JsonAccess*(NSString *key) {
//
//        self.data = [self checkValueType:[NSString class] key:key];
//        return self;
//
//    };
//}
//
//- (JsonAccess *(^)(NSString *))number
//{
//    return ^JsonAccess*(NSString *key) {
//
//        self.data = [self checkValueType:[NSNumber class] key:key];
//        return self;
//    };
//}
//
//- (JsonAccess *(^)(NSString *))array
//{
//    return ^JsonAccess*(NSString *key) {
//
//        self.data = [self checkValueType:[NSArray class] key:key];
//        return self;
//    };
//}
//
//- (id)checkValueType:(Class)class key:(NSString *)key {
//
//    if (![key isKindOfClass:[NSString class]]) {
//        return nil;
//    }
//
//    if (![self.data isKindOfClass:[NSDictionary class]]) {
//        return nil;
//    }
//
//    NSObject *obj = ((NSDictionary *)self.data)[key];
//    if (![obj isKindOfClass:class]) {
//        return nil;
//    }
//
//    return obj;
//}
//
//- (JsonAccess *(^)(NSInteger ))dicIdx
//{
//    return ^JsonAccess*(NSInteger index) {
//
//        self.data = [self checkValueType:[NSDictionary class] index:index];
//        return self;
//    };
//}
//
//- (JsonAccess *(^)(NSInteger ))stringIdx
//{
//    return ^JsonAccess*(NSInteger index) {
//
//        self.data = [self checkValueType:[NSString class] index:index];
//        return self;
//    };
//}
//
//- (JsonAccess *(^)(NSInteger ))numberIdx
//{
//    return ^JsonAccess*(NSInteger index) {
//
//        self.data = [self checkValueType:[NSNumber class] index:index];
//        return self;
//    };
//}
//
//- (JsonAccess *(^)(NSInteger ))arrayIdx
//{
//    return ^JsonAccess*(NSInteger index) {
//
//        self.data = [self checkValueType:[NSArray class] index:index];
//        return self;
//    };
//}
//
//- (id)checkValueType:(Class)class index:(NSInteger)index {
//
//    if (index < 0) {
//        return nil;
//    }
//
//    if (![self.data isKindOfClass:[NSArray class]]) {
//        return nil;
//    }
//
//    if (((NSArray *)self.data).count <= index) {
//        return nil;
//    }
//
//    NSObject *obj = ((NSArray *)self.data)[index];
//    if (![obj isKindOfClass:class]) {
//        return nil;
//    }
//
//    return obj;
//}
//
//- (NSString *)stringValue {
//
//    if ([self.data isKindOfClass:[NSString class]]) {
//        return (NSString *)self.data;
//    }
//    return nil;
//}
//- (NSNumber *)numberValue {
//
//    if ([self.data isKindOfClass:[NSNumber class]]) {
//        return (NSNumber *)self.data;
//    }
//    return nil;
//
//}
//- (NSArray *)arrayValue {
//
//    if ([self.data isKindOfClass:[NSArray class]]) {
//        return (NSArray *)self.data;
//    }
//    return nil;
//}
//- (NSDictionary *)dicValue {
//
//    if ([self.data isKindOfClass:[NSDictionary class]]) {
//        return (NSDictionary *)self.data;
//    }
//    return nil;
//}
//
//@end
//
//
//
//@implementation NSDictionary (Json)
//
//- (JsonAccess *)ct_json {
//
//    JsonAccess *json = [JsonAccess new];
//    json.data = self;
//
//    return json;
//}
//
//
//
//- (NSDictionary *(^)(NSString *))ct_dic
//{
//    return ^NSDictionary*(NSString *key) {
//
//        return [self checkValueType:[NSDictionary class] key:key];
//    };
//}
//
//- (NSString *(^)(NSString *))ct_string
//{
//    return ^NSString*(NSString *key) {
//
//        return [self checkValueType:[NSString class] key:key];
//    };
//}
//
//- (NSNumber *(^)(NSString *))ct_number
//{
//    return ^NSNumber*(NSString *key) {
//
//        return [self checkValueType:[NSNumber class] key:key];
//    };
//}
//
//- (NSArray *(^)(NSString *))ct_array
//{
//    if (!self) {
//        return nil;
//    }
//
//    return ^NSArray*(NSString *key) {
//
//        return [self checkValueType:[NSArray class] key:key];
//    };
//}
//
//- (id)checkValueType:(Class)class key:(NSString *)key {
//
//    if (![key isKindOfClass:[NSString class]]) {
//        return nil;
//    }
//
//    NSObject *obj = self[key];
//    if (![obj isKindOfClass:class]) {
//        return nil;
//    }
//
//    return obj;
//}
//
//
//@end
//
//@implementation NSArray (Json)
//
//- (NSDictionary *(^)(NSInteger ))ct_dicIdx
//{
//    return ^NSDictionary*(NSInteger index) {
//
//        return [self checkValueType:[NSDictionary class] index:index];
//    };
//}
//
//- (NSString *(^)(NSInteger ))ct_stringIdx
//{
//    return ^NSString*(NSInteger index) {
//
//        return [self checkValueType:[NSString class] index:index];
//    };
//}
//
//- (NSNumber *(^)(NSInteger ))ct_numberIdx
//{
//    return ^NSNumber*(NSInteger index) {
//
//        return [self checkValueType:[NSNumber class] index:index];
//    };
//}
//
//- (NSArray *(^)(NSInteger ))ct_arrayIdx
//{
//    return ^NSArray*(NSInteger index) {
//
//        return [self checkValueType:[NSArray class] index:index];
//    };
//}
//
//- (id)checkValueType:(Class)class index:(NSInteger)index {
//
//    if (index < 0) {
//        return nil;
//    }
//
//    if (self.count <= index) {
//        return nil;
//    }
//
//    NSObject *obj = self[index];
//    if (![obj isKindOfClass:class]) {
//        return nil;
//    }
//
//    return obj;
//}
//
//
//
//
//@end
