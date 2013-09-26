#UINavigationController

##Basic Setup

_AppDelagate.m_

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption;
{

    UIViewController *feedViewController = [[UIViewController alloc] init];
    [feedViewController setTitle:@"Feed"];
    [feedViewController.view setBackgroundColor:[UIColor lightGrayColor]];

    UIViewController *feedDetailsViewController = [[UIViewController alloc] init];
    [feedDetailsViewController setTitle:@"Details"];
    [feedDetailsViewController.view setBackgroundColor:[UIColor grayColor]];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];

    [feedViewController.navigationController pushViewController:feedDetailsViewController animated:YES];

    return YES;

}
```