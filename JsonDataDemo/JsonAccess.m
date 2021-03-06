//
//  JsonAccess.m
//  JsonDataDemo
//
//  Created by nate on 2019/2/1.
//  Copyright © 2019 nate. All rights reserved.
//

#import "JsonAccess.h"

static inline NSNumber *IMNSNumberCreateFromID(__unsafe_unretained id value) {
    static NSCharacterSet *dot;
    static NSDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dot = [NSCharacterSet characterSetWithRange:NSMakeRange('.', 1)];
        dic = @{@"TRUE" :   @(YES),
                @"True" :   @(YES),
                @"true" :   @(YES),
                @"FALSE" :  @(NO),
                @"False" :  @(NO),
                @"false" :  @(NO),
                @"YES" :    @(YES),
                @"Yes" :    @(YES),
                @"yes" :    @(YES),
                @"NO" :     @(NO),
                @"No" :     @(NO),
                @"no" :     @(NO),
                @"NIL" :    (id)kCFNull,
                @"Nil" :    (id)kCFNull,
                @"nil" :    (id)kCFNull,
                @"NULL" :   (id)kCFNull,
                @"Null" :   (id)kCFNull,
                @"null" :   (id)kCFNull,
                @"(NULL)" : (id)kCFNull,
                @"(Null)" : (id)kCFNull,
                @"(null)" : (id)kCFNull,
                @"<NULL>" : (id)kCFNull,
                @"<Null>" : (id)kCFNull,
                @"<null>" : (id)kCFNull};
    });
    
    if (!value || value == (id)kCFNull) return nil;
    if ([value isKindOfClass:[NSNumber class]]) return value;
    if ([value isKindOfClass:[NSString class]]) {
        NSNumber *num = dic[value];
        if (num != nil) {
            if (num == (id)kCFNull) return nil;
            return num;
        }
        if ([(NSString *)value rangeOfCharacterFromSet:dot].location != NSNotFound) {
            const char *cstring = ((NSString *)value).UTF8String;
            if (!cstring) return nil;
            double num = atof(cstring);
            if (isnan(num) || isinf(num)) return nil;
            return @(num);
        } else {
            const char *cstring = ((NSString *)value).UTF8String;
            if (!cstring) return nil;
            return @(atoll(cstring));
        }
    }
    return nil;
}


@interface JsonAccess()

@property (nonatomic, strong) NSObject *data;

@end

JsonAccess* Json(NSObject *obj) {
    
    JsonAccess *json = [JsonAccess new];
    if ([obj isKindOfClass:[NSDictionary class]]
        || [obj isKindOfClass:[NSArray class]]) {
        
        json.data = obj;
    }
    
    return json;
}

@implementation JsonAccess


- (JsonAccess *(^)(NSString *))key {
    
    return ^JsonAccess*(NSString *key) {
        
        self.data = [self checkValueType:[NSObject class] key:key];
        return self;
    };
}

- (JsonAccess *(^)(NSInteger ))index {
    
    return ^JsonAccess*(NSInteger index) {
        
        self.data = [self checkValueType:[NSObject class] index:index];
        return self;
    };
}

- (NSString *)string {
    
    if ([self.data isKindOfClass:[NSString class]]) {
        return (NSString *)self.data;
    } else if ([self.data isKindOfClass:[NSNumber class]]) {
        
        return ((NSNumber *)self.data).stringValue;
    }
    return nil;
}
- ( NSNumber *)number {
    
    if ([self.data isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)self.data;
    } else if ([self.data isKindOfClass:[NSString class]]) {
        
        return IMNSNumberCreateFromID(self.data);
    }
    return nil;
    
}
- ( NSArray *)array {
    
    if ([self.data isKindOfClass:[NSArray class]]) {
        return (NSArray *)self.data;
    }
    return nil;
}
- (NSDictionary *)dictionary {
    
    if ([self.data isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)self.data;
    }
    return nil;
}

- (id)checkValueType:(Class)class key:(NSString *)key {
    
    if (![key isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    if (![self.data isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSObject *obj = ((NSDictionary *)self.data)[key];
    if (![obj isKindOfClass:class]) {
        return nil;
    }
    
    return obj;
}

- (id)checkValueType:(Class)class index:(NSInteger)index {
    
    if (index < 0) {
        return nil;
    }
    
    if (![self.data isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    if (((NSArray *)self.data).count <= index) {
        return nil;
    }
    
    NSObject *obj = ((NSArray *)self.data)[index];
    if (![obj isKindOfClass:class]) {
        return nil;
    }
    
    return obj;
}

-(JsonAccess *)objectAtIndexedSubscript:(NSUInteger)idx {
    
    return self.index(idx);
}

//- (void)setObject:(id)anObject atIndexedSubscript:(NSUInteger)index{
//    [self setValue:anObject forKey:[NSString stringWithFormat:@"_index%lu",index]];
//}

-(JsonAccess *)objectForKeyedSubscript:(id)key {
    return self.key(key);
}

//- (void)setObject:(id)object forKeyedSubscript:(id < NSCopying >)aKey{
//    [self setValue:object forKey:aKey];
//}

@end
