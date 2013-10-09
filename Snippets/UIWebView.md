#UIWebView

```objc
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

    UIViewController *viewController = [[UIViewController alloc] init];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com/"]]];

    [viewController.view addSubview:webView];

    [self presentViewController:viewController animated:YES completion:nil];

}
```