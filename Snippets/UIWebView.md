#UIWebView

###Simple WebView in ViewController

```objc
- (void)viewDidLoad
{

    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com/"]]];

    [self.view addSubview:webView];

}
```

###WebView Presented in New ViewController with Dismiss Ability

```objc
@interface ViewController ()
{

    UIViewController *viewController;

}
@end

@implementation ViewController

- (void)viewDidLoad
{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(60, 50, 200, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Open Google.com" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)buttonPressed:(UIButton *)sender;
{

    viewController = [[UIViewController alloc] init];
    [viewController.view setBackgroundColor:[UIColor whiteColor]];

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];

    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:nil action:@selector(closeWebView)];

    [toolbar setItems:@[flexibleSpace, closeButton]];

    [viewController.view addSubview:toolbar];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height - 60)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com/"]]];

    [viewController.view addSubview:webView];

    [self presentViewController:viewController animated:YES completion:nil];

}

- (void)closeWebView;
{

    [viewController dismissViewControllerAnimated:YES completion:nil];

}

@end
```