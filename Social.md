#Social

##Twitter/Facebook Post Buttons

```objc
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

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(superview, twitterButton, facebookButton) visualFormats:@[@"|-[twitterButton(facebookButton)]-[facebookButton]-|"] metrics:nil options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(superview, twitterButton, facebookButton) visualFormats:@[@"[superview]-(<=1)-[twitterButton]"] metrics:nil options:NSLayoutFormatAlignAllCenterY];

    [self setConstraintsForViews:NSDictionaryOfVariableBindings(superview, twitterButton, facebookButton) visualFormats:@[@"V:[twitterButton(buttonHeight)]"] metrics:@{@"buttonHeight":@50.0} options:0];

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

        if (![view isDescendantOfView:self.view] && ![view isEqual:self.view]) {

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

@end
```