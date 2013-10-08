#UITableViewController

```objc
// AppDelagate.m

#import "AppDelegate.h"
#import "TableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITableViewController *tableViewController = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
    [tableViewController setTitle:@"Test Table"];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableViewController];

    self.window.rootViewController = navController;

    [self.window makeKeyAndVisible];

    return YES;

}

@end
```

```objc
// TableViewController.m

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [cell.textLabel setText:[NSString stringWithFormat:@"Test %u", indexPath.item + 1]];

    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UIViewController *viewController = [[UIViewController alloc] init];
    [viewController.view setBackgroundColor:[UIColor whiteColor]];

    [self.navigationController pushViewController:viewController animated:YES];

}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES; // Set to NO to disable scroll to top.
}

@end
```

##Adding Pull to Refresh (Add to above code)

```objc
// TableViewController.m

- (void)viewDidLoad
{

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];

}

- (void)refresh:(UIRefreshControl *)sender;
{

    [sender endRefreshing];

}
```