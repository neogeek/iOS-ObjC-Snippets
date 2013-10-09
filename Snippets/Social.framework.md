#Social.framework

###Twitter/Facebook Post Buttons

```objc
// ViewController.m

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()
{
    SLComposeViewController *composeViewController;

    UIButton *twitterButton;
    UIButton *facebookButton;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    NSLog(@"%f", self.view.frame.size.width);

    twitterButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [twitterButton setFrame:CGRectMake(60, 50, 200, 44)];
    [twitterButton setBackgroundColor:[UIColor lightGrayColor]];
    [twitterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [twitterButton setTitle:@"Post With Twitter" forState:UIControlStateNormal];
    [twitterButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [twitterButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twitterButton];

    facebookButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [facebookButton setFrame:CGRectMake(60, 100, 200, 44)];
    [facebookButton setBackgroundColor:[UIColor lightGrayColor]];
    [facebookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [facebookButton setTitle:@"Post With Facebook" forState:UIControlStateNormal];
    [facebookButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [facebookButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebookButton];

}

- (void)buttonPressed:(UIButton *)sender;
{

    if ([sender isEqual:twitterButton]) {

        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {

            composeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [composeViewController setInitialText:@"Check out this cool app I built! (There is no real app, this is a test.)"];

            [self presentViewController:composeViewController animated:YES completion:nil];

        }

    } else if ([sender isEqual:facebookButton]) {

        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {

            composeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [composeViewController setInitialText:@"Check out this cool app I built! (There is no real app, this is a test.)"];

            [self presentViewController:composeViewController animated:YES completion:nil];

        }

    }

}

@end
```