#UITextView

```objc
// ViewController.m

- (void)viewDidLoad
{

    UITextView *descriptionText = [[UITextView alloc] initWithFrame:CGRectMake(20, 40, 280, 200)];
    [descriptionText setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [descriptionText setEditable:NO];
    [descriptionText setText:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."];
    [self.view addSubview:descriptionText];

}
```