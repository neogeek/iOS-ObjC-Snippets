#ContraintsViewController

> A method for streamlining the creation of Auto Layout Contraints using VFL (Visual Format Language).

##Usage

First drag the **ContraintsViewController** folder into your project. Be sure to check off **Copy items into destination group's folder (if needed)** in the dialog that pops up.

![screenshot](http://f.cl.ly/items/243F3M193I162o3e1Q3u/Screen%20Shot%202013-10-01%20at%2011.53.23%20AM.png)

Then import the header file into the view controller you would like to use the `setConstraintsForViews` method with. Then change `UIViewController` to `ContraintsViewController`.

```objc
#import <UIKit/UIKit.h>
#import "ContraintsViewController.h"

@interface ViewController : ContraintsViewController

@end
```

Now you can use AutoLayout like this ...

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

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(button1, button2)
                   visualFormats:@[@"|-[button1(button2)]-[button2]-|", @"V:[button1(height)]-|"]
                         metrics:@{@"height":@50.0}
                         options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom];

}
```

... rather than this.

```objc
- (void)viewDidLoad
{

    UIButton *button1 = [[UIButton alloc] init];
    [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor darkGrayColor]];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:button1];

    UIButton *button2 = [[UIButton alloc] init];
    [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor darkGrayColor]];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:button2];

    NSDictionary *metrics = @{@"height":@50.0};
    NSDictionary *views = NSDictionaryOfVariableBindings(button1, button2);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[button1(button2)]-[button2]-|"
                                                                      options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                                                                      metrics:nil
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button1(height)]-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];

}
```