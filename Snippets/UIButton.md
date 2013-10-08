#UIButton

```objc
// ViewController.m

- (void)viewDidLoad
{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 50, 120, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Tap me!" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)buttonPressed:(UIButton *)sender;
{

    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                      message:@"Hello World!"
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"OK", nil];
    [message show];

}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    NSLog(@"%ld", (long)buttonIndex);

    switch (buttonIndex) {
        case 0: {
            NSLog(@"Cancel");
            break;
        }
        case 1: {
            NSLog(@"OK");
            break;
        }
    }

}
```