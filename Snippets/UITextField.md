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
    UITextField *textfield;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    textfield = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, 280, 50)];
    [textfield setBorderStyle:UITextBorderStyleRoundedRect];
    [textfield setDelegate:self];
    [self.view addSubview:textfield];

    UITapGestureRecognizer *tapView = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];

    [self.view addGestureRecognizer:tapView];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textfield
{
    [self dismissKeyboard];
    return YES;
}

-(void)dismissKeyboard;
{
    [textfield resignFirstResponder];
}

@end
```