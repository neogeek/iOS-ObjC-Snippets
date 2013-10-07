#Settings

```objc
// AppDelegate.m

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults registerDefaults:@{@"apiKey":nil}];

    return YES;

}
```

```objc
// ViewController.m

- (void)viewDidLoad
{

    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"APIKEY: %@", [defaults valueForKey:@"apiKey"]);

}
```