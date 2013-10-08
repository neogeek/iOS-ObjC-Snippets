#Social.framework

###Twitter/Facebook Post Buttons [_setConstraintsForViews_](../Libraries/ConstraintsViewController/)

```objc
// ViewController.h

#import <UIKit/UIKit.h>
#import "ConstraintsViewController.h"

@interface ViewController : ConstraintsViewController

@end
```

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

- (void)viewDidLoad;
{

    UIView *superview = self.view;

    twitterButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [twitterButton setBackgroundColor:[UIColor lightGrayColor]];
    [twitterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [twitterButton setTitle:@"Post With Twitter" forState:UIControlStateNormal];
    [twitterButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [twitterButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

    facebookButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [facebookButton setBackgroundColor:[UIColor lightGrayColor]];
    [facebookButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [facebookButton setTitle:@"Post With Facebook" forState:UIControlStateNormal];
    [facebookButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [facebookButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(superview, twitterButton, facebookButton)
                   visualFormats:@[@"|-[twitterButton(facebookButton)]-[facebookButton]-|"]
                         metrics:nil
                         options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(superview, twitterButton, facebookButton)
                   visualFormats:@[@"[superview]-(<=1)-[twitterButton]"]
                         metrics:nil
                         options:NSLayoutFormatAlignAllCenterY];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(superview, twitterButton, facebookButton)
                   visualFormats:@[@"V:[twitterButton(buttonHeight)]"]
                         metrics:@{@"buttonHeight":@50.0}
                         options:0];

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