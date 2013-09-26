#UIImage

_ViewController.m_

```objc
- (void)viewDidLoad;
{

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];
    UIImage *image = [UIImage imageNamed:@"avatar.jpg"];
    [imageView setImage:image];
    [self.view addSubview:imageView];

}
```

```objc
- (void)viewDidLoad
{

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 275, 95)];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://www.google.com/images/srpr/logo4w.png"]]];
    [imageView setImage:image];
    [self.view addSubview:imageView];

}
```