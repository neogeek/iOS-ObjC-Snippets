#ConstraintsViewController

> A method for streamlining the creation of Auto Layout Constraints using VFL (Visual Format Language).

##Usage

First drag the **ConstraintsViewController** folder into your project. Be sure to check off **Copy items into destination group's folder (if needed)** in the dialog that pops up.

![xcode-screenshot](http://f.cl.ly/items/0W2f1c3Y343k2B3A1i14/ConstraintsViewController-xcode-screenshot.png)

Import into the header file of the view controller you will be working in, then change object `UIViewController` to `ConstraintsViewController`.

```objc
#import <UIKit/UIKit.h>
#import "ConstraintsViewController.h"

@interface ViewController : ConstraintsViewController

@end
```

Now you can use AutoLayout like this ...

```objc
- (void)viewDidLoad
{

    UIButton *headerButton = [[UIButton alloc] init];
    [headerButton setTitle:@"Header 1" forState:UIControlStateNormal];
    [headerButton setBackgroundColor:[UIColor darkGrayColor]];
    [headerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    UIButton *contentButton = [[UIButton alloc] init];
    [contentButton setTitle:@"Content 1" forState:UIControlStateNormal];
    [contentButton setBackgroundColor:[UIColor darkGrayColor]];
    [contentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    UIButton *bottomButton1 = [[UIButton alloc] init];
    [bottomButton1 setTitle:@"Bottom 1" forState:UIControlStateNormal];
    [bottomButton1 setBackgroundColor:[UIColor darkGrayColor]];
    [bottomButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    UIButton *bottomButton2 = [[UIButton alloc] init];
    [bottomButton2 setTitle:@"Bottom 2" forState:UIControlStateNormal];
    [bottomButton2 setBackgroundColor:[UIColor darkGrayColor]];
    [bottomButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(headerButton, contentButton, bottomButton1, bottomButton2)
                   visualFormats:@[
                                   @"|-(innerSpacing)-[headerButton]-(innerSpacing)-|",
                                   @"|-(innerSpacing)-[contentButton]-(innerSpacing)-|",
                                   @"|-(innerSpacing)-[bottomButton1(bottomButton2)]-[bottomButton2]-(innerSpacing)-|"
                                   ]
                         metrics:@{@"headerHeight":@75.0, @"bottomButtonHeight":@40.0, @"innerSpacing":@10.0}
                         options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
     ];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(headerButton, contentButton, bottomButton1, bottomButton2)
                   visualFormats:@[@"V:|-[headerButton(headerHeight)]-[contentButton]-[bottomButton1(bottomButtonHeight)]-(innerSpacing)-|"]
                         metrics:@{@"headerHeight":@75.0, @"bottomButtonHeight":@40.0, @"innerSpacing":@10.0}
                         options:0
     ];

}
```

... rather than this.

```objc
- (void)viewDidLoad
{

    UIButton *headerButton = [[UIButton alloc] init];
    [headerButton setTitle:@"Header 1" forState:UIControlStateNormal];
    [headerButton setBackgroundColor:[UIColor darkGrayColor]];
    [headerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [headerButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:headerButton];

    UIButton *contentButton = [[UIButton alloc] init];
    [contentButton setTitle:@"Content 1" forState:UIControlStateNormal];
    [contentButton setBackgroundColor:[UIColor darkGrayColor]];
    [contentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [contentButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:contentButton];

    UIButton *bottomButton1 = [[UIButton alloc] init];
    [bottomButton1 setTitle:@"Bottom 1" forState:UIControlStateNormal];
    [bottomButton1 setBackgroundColor:[UIColor darkGrayColor]];
    [bottomButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [bottomButton1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:bottomButton1];

    UIButton *bottomButton2 = [[UIButton alloc] init];
    [bottomButton2 setTitle:@"Bottom 2" forState:UIControlStateNormal];
    [bottomButton2 setBackgroundColor:[UIColor darkGrayColor]];
    [bottomButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [bottomButton2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:bottomButton2];

    NSDictionary *metrics = @{@"headerHeight":@75.0, @"bottomButtonHeight":@40.0, @"innerSpacing":@10.0};
    NSDictionary *views = NSDictionaryOfVariableBindings(headerButton, contentButton, bottomButton1, bottomButton2);

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(innerSpacing)-[headerButton]-(innerSpacing)-|"
                                                                      options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                                                                      metrics:metrics
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(innerSpacing)-[contentButton]-(innerSpacing)-|"
                                                                      options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                                                                      metrics:metrics
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-(innerSpacing)-[bottomButton1(bottomButton2)]-[bottomButton2]-(innerSpacing)-|"
                                                                      options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
                                                                      metrics:metrics
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[headerButton(headerHeight)]-[contentButton]-[bottomButton1(bottomButtonHeight)]-(innerSpacing)-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];

}
```

##Screnshots

![iphone-screenshot](http://f.cl.ly/items/1Q0k372B1Z20340l2O14/ConstraintsViewController-iphone-portrait-screenshot.png)
![iphone-screenshot](http://f.cl.ly/items/0U2A1X0B1N1A3f02223V/ConstraintsViewController-iphone-landscape-screenshot.png)