#NSUserDefaults

```objc
// ViewController.m

- (void)viewDidLoad
{

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSArray *hats = @[@"cowboy hat", @"conductor cap", @"baseball hat", @"beanie", @"beret", @"fez"];

    // Storing hats in user defaults
    [userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:hats] forKey:@"hats"];

    // Retrieving hats from user defaults
    NSArray *storedHats = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefaults objectForKey:@"hats"]];

    NSLog(@"%@", hats);
    NSLog(@"%@", storedHats);

}
```