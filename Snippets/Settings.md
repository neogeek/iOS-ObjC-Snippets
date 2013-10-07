#Settings

```objc
// AppDelegate.m

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults registerDefaults:@{@"name_preference":@""}];

    return YES;

}
```

```objc
// ViewController.m

- (void)viewDidLoad
{

    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"Name: %@", [defaults valueForKey:@"name_preference"]);

}
```