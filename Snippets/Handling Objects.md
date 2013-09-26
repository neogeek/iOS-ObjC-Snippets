#Handling Objects

##Comparing Objects

```objc
@interface ViewController ()
{

    UIButton *button;

}
@end

@implementation ViewController

- (void)viewDidLoad;
{

    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 50, 120, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Tap me!" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)buttonPressed:(UIButton *)sender;
{
    if ([sender isEqual:button]) {

        NSLog(@"Hey button!");

    }

}

@end
```