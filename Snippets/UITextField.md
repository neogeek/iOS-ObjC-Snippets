#UITextField

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