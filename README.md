# JsonDataDemo

一个json类型数组和字典的解析工具，链式调用、字面量语法。

### 使用

```
 NSLog(@"%@", Json(resultJSON)
          .key(@"ext")
          .key(@"btnList")
          .index(0)
          .key(@"btnTitle").string);
    //按钮标题
    
    NSLog(@"%@",Json(resultJSON)[@"ext"][@"btnList"][0][@"btnTitle"].string);
```
详细见demo。

### 问题

一直很烦json数据的解析，可实际编程中往往就是需要去解析json.

可能会出现下面的代码
```
        if (!isValidDictionary(json)) {
            return ;
        }
        
        NSDictionary *responseDictionary = json[kResponseStatus];
        if (!isValidDictionary(responseDictionary)) 
            return ;
        }
        
        if (![responseDictionary[kAck] isEqualToString:kSuccess]) {
            return ;
        }
        
        NSNumber *code = json[@"code"];
        if (!code) {
            return ;
        }
```
很不方便，更加容易出错。
### JsonAccess
```
         if (![Json(json)
              .key(kResponseStatus)
              .key(kAck)
              .string isEqualToString:kSuccess]) {
            return ;
        }
```
一行代码，链式调用，只关心最终结果。更加有字面量语法的支持
```
     Json(resultJSON)[@"ext"][@"btnList"][0][@"btnTitle"].string
```

博客 https://www.jianshu.com/p/a59d75684da3
