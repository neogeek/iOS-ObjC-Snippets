#AutoLayout

###Basic Setup

**Two Buttons Anchored to the Bottom**

```objc
// ViewController.m

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

###Using Custom Function [_setConstraintsForViews_](../Libraries/ContraintsViewController/)

**Two Buttons Anchored to the Bottom**

```objc
// ViewController.m

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
                         options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom
     ];

}
```

###More Advanced Example of using [_setConstraintsForViews_](../Libraries/ContraintsViewController/)

**Layout with header, main content area, and footer.**

```objc
// ViewController.m

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