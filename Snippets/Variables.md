#Variables

###Constants

```objc
#define WEATHER_API_URL @"http://warm-wildwood-5296.herokuapp.com/"
```

###String

```objc
NSString *firstName = @"Scott";
NSString *lastName = @"Doxey";
NSString *fullname = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
NSLog(@"%@", fullname);
```

###Number

```objc
NSNumber *age = @29;
NSLog(@"%@", age);
```

###Unsigned Integer

```objc
NSUInteger age = [@29 unsignedIntegerValue];
NSLog(@"%lu", (unsigned long)age);
```

###Array

```objc
NSArray *apps = @[@"Pages", @"Numbers", @"Keynote"];
NSLog(@"%@", apps);
```

###Dictionary

```objc
NSDictionary *user = @{@"First Name": @"Scott", @"Last Name": @"Doxey"};
NSLog(@"%@", user);
```

###Log Object Type

```objc
NSDictionary *user = @{@"First Name": @"Scott", @"Last Name": @"Doxey"};
NSLog(@"%@", [user class]);
```

###Log NSDictionary Keys

```objc
NSDictionary *user = @{@"First Name": @"Scott", @"Last Name": @"Doxey"};
NSLog(@"%@", [user allKeys]);
```

###Log NSDictionary Values

```objc
NSDictionary *user = @{@"First Name": @"Scott", @"Last Name": @"Doxey"};
NSLog(@"%@", [user allValues]);
```

###URL

_ViewController.m_

```objc
@interface ViewController ()
{

    NSMutableData *responseData;

}
@end

@implementation ViewController

- (void)viewDidLoad
{

    NSURL *weatherAPIURL = [NSURL URLWithString:@"http://warm-wildwood-5296.herokuapp.com/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:weatherAPIURL];

    [[NSURLConnection alloc] initWithRequest:request delegate:self];

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
{

    responseData = [[NSMutableData alloc] init];

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{

    [responseData appendData:data];

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
{

    NSError *error;

    NSDictionary *cities = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];

    for (NSDictionary *city in cities) {

        NSLog(@"%@", city);

    }

    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

}

@end
```

###ENUM

```objc
typedef NS_ENUM(NSInteger, DayOfWeek) {
    DayOfWeekMonday = 1,
    DayOfWeekTuesday = 2,
    DayOfWeekWednesday = 3,
    DayOfWeekThursday = 4,
    DayOfWeekFriday = 5,
    DayOfWeekSaturday = 6,
    DayOfWeekSunday = 7
};

NSLog(@"%ld", (long)DayOfWeekMonday);
```

###Empty Variables

```objc
NSString *emptyString = [NSString string];
NSArray *emptyArray = [NSArray array];
NSDictionary *emptyDict = [NSDictionary dictionary];
```

###Copying Variables

```objc
NSString *firstName = @"Scott";

NSString *otherString = [NSString stringWithString:firstName];
NSString *copy = [[NSString alloc] initWithString:otherString];

NSLog(@"%@", otherString);
NSLog(@"%@", copy);
```