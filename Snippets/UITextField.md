#UITextField

```objc
// ViewController.h

@interface ViewController : UIViewController <UITextFieldDelegate>

@end
```

```objc
// ViewController.m

@interface ViewController ()
{
    UITextField *textField;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, 280, 50)];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setDelegate:self];
    [self.view addSubview:textField];

    UITapGestureRecognizer *tapView = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];

    [self.view addGestureRecognizer:tapView];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self dismissKeyboard];
    return YES;
}

-(void)dismissKeyboard;
{
    [textField resignFirstResponder];
}

@end

```