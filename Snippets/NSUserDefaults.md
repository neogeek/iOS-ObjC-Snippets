#NSUserDefaults

```objc
// ViewController.m

@interface ViewController ()
{
    UITextView *textView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    textView = [[UITextView alloc] initWithFrame:self.view.frame];
    [textView setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [textView setEditable:NO];
    [self.view addSubview:textView];

    NSArray *hats = @[@"cowboy hat", @"conductor cap", @"baseball hat", @"beanie", @"beret", @"fez"];

    [self logHatsWithText:@"After load:"];

    // Storing hats in user defaults
    [[NSUserDefaults standardUserDefaults] setObject:hats forKey:@"hats"];

    [self logHatsWithText:@"After save:"];

    // Retrieving hats from user defaults
    NSArray *storedHats = [[NSUserDefaults standardUserDefaults] valueForKey:@"hats"];

    NSLog(@"%@", storedHats);

    // Removing hats from user defaults
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"hats"];

    [self logHatsWithText:@"After delete:"];

}

- (void)logHatsWithText:(NSString *)text;
{

    NSArray *storedHats = [[NSUserDefaults standardUserDefaults] valueForKey:@"hats"];

    [textView setText:[NSString stringWithFormat:@"%@\n%@\n%@", [textView text], text, storedHats]];

}

@end

```