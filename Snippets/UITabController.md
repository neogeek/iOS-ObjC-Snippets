#UITabController

##Basic Setup

_AppDelagate.m_

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption;
{

    UIViewController *feedViewController = [[UIViewController alloc] init];
    [feedViewController.view setBackgroundColor:[UIColor blueColor]];
    UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController:feedViewController];
    [feedNavigationController setTitle:@"Feed"];

    UIViewController *profileViewController = [[UIViewController alloc] init];
    [profileViewController.view setBackgroundColor:[UIColor greenColor]];
    UINavigationController *profileNavigationController = [[UINavigationController alloc] initWithRootViewController:profileViewController];
    [profileNavigationController setTitle:@"Profile"];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];

    [tabBarController setViewControllers:@[feedNavigationController, profileNavigationController]];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;

    [self.window makeKeyAndVisible];

    return YES;

}
```