#Handling Objects

###Comparing Objects

**Checking to see which button was pressed**

```objc
@interface ViewController ()
{

    UIButton *button1;
    UIButton *button2;

}
@end

@implementation ViewController

- (void)viewDidLoad;
{

    button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setFrame:CGRectMake(100, 50, 120, 44)];
    [button1 setBackgroundColor:[UIColor lightGrayColor]];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

    button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setFrame:CGRectMake(100, 100, 120, 44)];
    [button2 setBackgroundColor:[UIColor lightGrayColor]];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

}

- (void)buttonPressed:(UIButton *)sender;
{
    if ([sender isEqual:button1]) {

        NSLog(@"Hey button 1!");

    } else if ([sender isEqual:button2]) {

        NSLog(@"Hey button 2!");

    }

}

@end
```