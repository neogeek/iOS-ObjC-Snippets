#UILabel

```objc
// ViewController.m

- (void)viewDidLoad
{

    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 100, 20)];
    [firstLabel setText:@"Hello world!"];
    [self.view addSubview:firstLabel];

}
```