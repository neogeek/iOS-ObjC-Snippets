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
NSArray *hats = @[@"Cowboy", @"Conductor", @"Baseball", @"Beanie", @"Beret", @"Fez"];

[hats enumerateObjectsUsingBlock:^(NSString *hat, NSUInteger index, BOOL *stop) {
        NSLog(@"Trying on a %@ hat.", hat);
    }
 ];
```

###Using Varaibles From Outside a Block

```objc
__block NSString *greeting = @"How cool!";

NSArray *hats = @[@"Cowboy", @"Conductor", @"Baseball", @"Beanie", @"Beret", @"Fez"];

[hats enumerateObjectsUsingBlock:^(NSString *hat, NSUInteger index, BOOL *stop) {
        NSLog(@"Trying on a %@ hat. %@", hat, greeting);
    }
 ];
```