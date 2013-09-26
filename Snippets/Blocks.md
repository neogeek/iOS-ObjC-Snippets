#Blocks

###Basic Block

```objc
void (^sumNumbers)(NSUInteger, NSUInteger) = ^(NSUInteger num1, NSUInteger num2) {
    NSLog(@"The sum of %lu and %lu is %u", (unsigned long)num1, (unsigned long)num2, num1 + num2);
};

sumNumbers(30, 70);
```

###Enumerating With a Block

```objc
NSArray *hats = @[@"cowboy hat", @"conductor cap", @"baseball hat", @"beanie", @"beret", @"fez"];

[hats enumerateObjectsUsingBlock:^(NSString *hat, NSUInteger index, BOOL *stop) {
    NSLog(@"Trying on a %@.", hat);
}
 ];
```

###Using Varaibles From Outside a Block

```objc
NSArray *hats = @[@"cowboy hat", @"conductor cap", @"baseball hat", @"beanie", @"beret", @"fez"];

[hats enumerateObjectsUsingBlock:^(NSString *hat, NSUInteger index, BOOL *stop) {
    NSLog(@"Trying on a %@. %@", hat, greeting);
}
 ];
```