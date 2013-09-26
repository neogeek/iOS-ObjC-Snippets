#UIActionSheet

```objc
- (void)viewDidLoad;
{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 50, 120, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Share Photo" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)buttonPressed:(UIButton *)sender;
{

    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Twitter", @"Facebook", @"Instagram", nil];

    [actionSheet showInView:self.view];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
{

    typedef NS_ENUM(NSInteger, actionButton) {
        actionButtonTwitter = 0,
        actionButtonFacebook = 1,
        actionButtonInstagram = 2
    };

    switch (buttonIndex) {
        case actionButtonTwitter:
            NSLog(@"Twitter Selected");
            break;

        case actionButtonFacebook:
            NSLog(@"Facebook Selected");
            break;

        case actionButtonInstagram:
            NSLog(@"Instagram Selected");
            break;

        default:
            NSLog(@"Share Photo Canceled");
            break;
    }

}
```