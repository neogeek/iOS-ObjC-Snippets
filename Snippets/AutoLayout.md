#AutoLayout

###Basic Implementation

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
                                                                      metrics:metrics
                                                                        views:views]];

    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button1(height)]-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];

}
```

###Using Custom Function _setConstraintsForViews_

```objc
- (void)viewDidLoad
{

    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"Button 1" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor darkGrayColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(button) visualFormats:@[@"|-[button]-|", @"V:[button(height)]-|"] metrics:@{@"height":@50.0} options:0];

}

/**
 * Streamlines the creation of Auto Layout Contraints using VFL (Visual Format Language)
 *
 *  [self setConstraintsForViews:NSDictionaryOfVariableBindings(button) visualFormats:@[@"|-[button]-|", @"V:[button(height)]-|"] metrics:@{@"height":@50.0} options:0];
 *
 * @param {NSDictionary} setConstraintsForViews A NSDictionaryOfVariableBindings object containing the views to be positioned through autolayout.
 * @param {NSArray} visualFormats An NSArray of visual format strings.
 * @param {NSDictionary} metrics An NSDictionary object containing visual format variables.
 * @param {NSLayoutFormatOptions} options An NSLayoutFormatOptions object containing one (or two) alignment options.
 * @return {void}
 * @api public
 */

- (void)setConstraintsForViews:(NSDictionary *)views visualFormats:(NSArray *)visualFormats metrics:(NSDictionary *)metrics options:(NSLayoutFormatOptions)options;
{

    for (UIView *view in [views allValues]) {

        if (![view isDescendantOfView:self.view]) {

            [self.view addSubview:view];

        }

        [view setTranslatesAutoresizingMaskIntoConstraints:NO];

    }

    NSMutableDictionary *allMetrics = [[NSMutableDictionary alloc] initWithDictionary:metrics];

    [allMetrics setValue:@(UILayoutPriorityDefaultHigh) forKey:@"_priorityHigh"];
    [allMetrics setValue:@(UILayoutPriorityDefaultLow) forKey:@"_priorityLow"];
    [allMetrics setValue:@(UILayoutPriorityRequired) forKey:@"_priorityRequired"];

    for (NSString *format in visualFormats) {

        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:options metrics:allMetrics views:views]];

    }

}
```

###More Advanced Example of using _setConstraintsForViews_

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

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(headerButton, contentButton, bottomButton1, bottomButton2) visualFormats:@[@"|-(innerSpacing)-[headerButton]-(innerSpacing)-|", @"|-(innerSpacing)-[contentButton]-(innerSpacing)-|", @"|-(innerSpacing)-[bottomButton1(bottomButton2)]-[bottomButton2]-(innerSpacing)-|"] metrics:@{@"headerHeight":@75.0, @"bottomButtonHeight":@40.0, @"innerSpacing":@10.0} options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(headerButton, contentButton, bottomButton1, bottomButton2) visualFormats:@[@"V:|-[headerButton(headerHeight)]-[contentButton]-[bottomButton1(bottomButtonHeight)]-(innerSpacing)-|"] metrics:@{@"headerHeight":@75.0, @"bottomButtonHeight":@40.0, @"innerSpacing":@10.0} options:0];

}

/**
 * Streamlines the creation of Auto Layout Contraints using VFL (Visual Format Language)
 *
 *  [self setConstraintsForViews:NSDictionaryOfVariableBindings(button) visualFormats:@[@"|-[button]-|", @"V:[button(height)]-|"] metrics:@{@"height":@50.0} options:0];
 *
 * @param {NSDictionary} setConstraintsForViews A NSDictionaryOfVariableBindings object containing the views to be positioned through autolayout.
 * @param {NSArray} visualFormats An NSArray of visual format strings.
 * @param {NSDictionary} metrics An NSDictionary object containing visual format variables.
 * @param {NSLayoutFormatOptions} options An NSLayoutFormatOptions object containing one (or two) alignment options.
 * @return {void}
 * @api public
 */

- (void)setConstraintsForViews:(NSDictionary *)views visualFormats:(NSArray *)visualFormats metrics:(NSDictionary *)metrics options:(NSLayoutFormatOptions)options;
{

    for (UIView *view in [views allValues]) {

        if (![view isDescendantOfView:self.view]) {

            [self.view addSubview:view];

        }

        [view setTranslatesAutoresizingMaskIntoConstraints:NO];

    }

    NSMutableDictionary *allMetrics = [[NSMutableDictionary alloc] initWithDictionary:metrics];

    [allMetrics setValue:@(UILayoutPriorityDefaultHigh) forKey:@"_priorityHigh"];
    [allMetrics setValue:@(UILayoutPriorityDefaultLow) forKey:@"_priorityLow"];
    [allMetrics setValue:@(UILayoutPriorityRequired) forKey:@"_priorityRequired"];

    for (NSString *format in visualFormats) {

        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:options metrics:allMetrics views:views]];

    }

}
```