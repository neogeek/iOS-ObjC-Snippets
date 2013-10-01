#ContraintsViewController

##Usage

First import the header file into the view controller you would like to use the `setConstraintsForViews` method with. Then change `UIViewController` to `ContraintsViewController`.

```objc
#import <UIKit/UIKit.h>
#import "ContraintsViewController.h"

@interface ViewController : ContraintsViewController

@end
```

In the implimintation file

```objc
- (void)viewDidLoad
{

    UIButton *button1 = [[UIButton alloc] init];
    [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor darkGrayColor]];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    UIButton *button2 = [[UIButton alloc] init];
    [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor darkGrayColor]];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(button1, button2) visualFormats:@[@"|-[button1(button2)]-[button2]-|", @"V:[button1(height)]-|"] metrics:@{@"height":@50.0} options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom];

}
```