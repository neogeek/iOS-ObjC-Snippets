//
//  ContraintsViewController.m
//  AutoLayout
//
//  Created by Scott Doxey on 10/1/13.
//  Copyright (c) 2013 Scott Doxey. All rights reserved.
//

#import "ContraintsViewController.h"

@interface ContraintsViewController ()

@end

@implementation ContraintsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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

@end
