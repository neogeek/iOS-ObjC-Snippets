#Logic

##Case Statement

**Note** Case statements only work with integers, not strings.

```objc
NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:[NSDate date]];

NSInteger day = [components weekday];

NSLog(@"%ld", (long)day);

switch (day) {
    case 1: {
        NSLog(@"Sunday");
        break;
    }
    case 2: {
        NSLog(@"Monday");
        break;
    }
    case 3: {
        NSLog(@"Tuesday");
        break;
    }
    case 4: {
        NSLog(@"Wednesday");
        break;
    }
    case 5: {
        NSLog(@"Thursday");
        break;
    }
    case 6: {
        NSLog(@"Friday");
        break;
    }
    case 7: {
        NSLog(@"Saturday");
        break;
    }
}
```

##Integer Comparison

```objc
NSNumber *scale = @8;

if ([scale intValue] < 10) {
    NSLog(@"Less than 10");
}
```

##String Comparison

```objc
NSString *hat = @"Fez";

if ([hat isEqualToString:@"Fedora"]) {
    NSLog(@"Hat is a Fedora.");
} else {
    NSLog(@"Hat is not a Fedora.");
}

if ([hat length]) {
    NSLog(@"You are wearing a hat.");
}
```