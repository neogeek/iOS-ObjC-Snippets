#UILabel

_ViewController.m_

```objc
- (void)viewDidLoad;
{

    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 100, 20)];
    [firstLabel setText:@"Hello world!"];
    [self.view addSubview:firstLabel];

}
```