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
