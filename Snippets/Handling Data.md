#Handling Data

##Convert JSON into Dictionary Object

```objc
NSData *data = [@"{\"status\": \"OK\"}" dataUsingEncoding:NSUTF8StringEncoding];

NSError *error;
NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

NSLog(@"Status: %@", [dataDictionary objectForKey:@"status"]);
NSLog(@"Status: %@", dataDictionary[@"status"]);
```

##Format Number

```objc
NSString *temp = [NSString stringWithFormat:@"%.1f", [@"89.98" floatValue]];
NSLog(@"%@", temp);
```

##Comparing Strings

```objc
if ([@"Hello World!" isEqualToString:@"Hello World!"]) {

    NSLog(@"Hello World! does indeed equal Hello World!");

}
```