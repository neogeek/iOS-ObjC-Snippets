#Miscellaneous Methods

###Network Activity Indicator

```objc
[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
```

###Getting Origin and Size of Status Bar

```objc
CGPoint statuBarOrigin = [UIApplication sharedApplication].statusBarFrame.origin;
NSLog(@"X: %f Y: %f", statuBarOrigin.x, statuBarOrigin.y);

CGSize statuBarSize = [UIApplication sharedApplication].statusBarFrame.size;
NSLog(@"Width: %f Height: %f", statuBarSize.width, statuBarSize.height);
```

###Setting Background (RGBA) Color

```objc
[self.view setBackgroundColor:[UIColor colorWithRed:255 green:0 blue:0 alpha:1]];
```

###Show Alert

```objc
UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                  message:@"Hello World!"
                                                 delegate:nil
                                        cancelButtonTitle:nil
                                        otherButtonTitles:@"OK", nil];
[message show];
```

###Setting a Timer

```objc
@interface ViewController ()
{

    NSTimer *timer;

}
@end

@implementation ViewController

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

    if (![timer isValid]) {

        timer = [NSTimer scheduledTimerWithTimeInterval:0
                                                 target:self
                                               selector:@selector(timerFunction:)
                                               userInfo:nil
                                                repeats:YES];

    } else {

        [timer invalidate];

    }

}

- (void)timerFunction:(NSTimer *)aTimer;
{

    NSLog(@"Hello!");

}

@end
```

###Animations

```objc
- (void)viewDidLoad;
{

    [self.view setBackgroundColor:[UIColor greenColor]];

    [UIView animateWithDuration:2 animations:^(void){

        self.view.alpha = 0.0f;

    } completion:^(BOOL completed) {

        [self.view setBackgroundColor:[UIColor blueColor]];

        [UIView animateWithDuration:1 animations:^(void){

            self.view.alpha = 1.0f;

        }];

    }];

}
```

###Remove SubViews From View

```objc
- (void)viewDidLoad;
{

    int length = 10;

    for (int i = 0; i < length; i = i + 1) {

        UIViewController *viewController = [[UIViewController alloc] init];
        [self.view addSubview:viewController.view];

    }

    NSLog(@"%lu# of subviews", (unsigned long)[[self.view subviews] count]);

    for (UIView *subview in [self.view subviews]) {
        [subview removeFromSuperview];
    }

    NSLog(@"%lu# of subviews", (unsigned long)[[self.view subviews] count]);

}
```

###UITapGestureRecognizer

```objc
- (void)viewDidLoad;
{

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];
    UIImage *image = [UIImage imageNamed:@"avatar.jpg"];
    [imageView setImage:image];
    [self.view addSubview:imageView];

    UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(captureTapOnImage:)];
    [imageView addGestureRecognizer:tapImage];
    [imageView setUserInteractionEnabled:YES];

}

- (void)captureTapOnImage:(UIGestureRecognizer *)gestureRecognizer;
{
    NSLog(@"Tap!");
}
```

###Throw Exception

```objc
[NSException raise:@"Invalid foo value" format:@"foo of %d is invalid", 2];
```