#UIViewController

###UIViewController as a Modal View

```objc
// ViewController.m

- (void)viewDidLoad
{

    [self.view setBackgroundColor:[UIColor greenColor]];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 50, 120, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Open View" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)openViewController:(UIButton *)sender;
{

    UIViewController *viewController = [[UIViewController alloc] init];
    [viewController.view setBackgroundColor:[UIColor blueColor]];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 50, 120, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Close View" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeViewController:) forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:button];

    [self presentViewController:viewController animated:YES completion:nil];

}

- (void)closeViewController:(UIButton *)sender;
{

    [self dismissViewControllerAnimated:YES completion:nil];

}
```

###UIViewController as a Modal View w/ Custom Animation

```objc
// ViewController.m

@interface ViewController ()
{
    UIViewController *modalViewController;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    [self.view setBackgroundColor:[UIColor greenColor]];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 50, 120, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Open View" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)openViewController:(UIButton *)sender;
{

    modalViewController = [[UIViewController alloc] init];
    [modalViewController.view setBackgroundColor:[UIColor blueColor]];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 50, 120, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Close View" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeViewController:) forControlEvents:UIControlEventTouchUpInside];
    [modalViewController.view addSubview:button];

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft
                           forView:self.view
                             cache:YES];
    [self.view addSubview:modalViewController.view];
    [UIView commitAnimations];

}

- (void)closeViewController:(UIButton *)sender;
{

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.view
                             cache:YES];
    [modalViewController.view removeFromSuperview];
    [UIView commitAnimations];

}

@end
```