#UI

##UITextField

_ViewController.h_

```objc
@interface ViewController : UIViewController <UITextFieldDelegate>

@end
```

_ViewController.m_

```objc
- (void)viewDidLoad;
{

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, 280, 50)];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setDelegate:self];
    [self.view addSubview:textField];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    [textField resignFirstResponder];
    return YES;
}
```

##UIButton

_ViewController.m_

```objc
- (void)viewDidLoad;
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

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
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

##UILabel

_ViewController.m_

```objc
- (void)viewDidLoad;
{

    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 100, 20)];
    [firstLabel setText:@"Hello world!"];
    [self.view addSubview:firstLabel];

}
```

##UITextView

_ViewController.m_

```objc
- (void)viewDidLoad;
{

    UITextView *descriptionText = [[UITextView alloc] initWithFrame:CGRectMake(20, 40, 280, 200)];
    [descriptionText setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [descriptionText setEditable:NO];
    [descriptionText setText:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."];
    [self.view addSubview:descriptionText];

}
```

##UIImage

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