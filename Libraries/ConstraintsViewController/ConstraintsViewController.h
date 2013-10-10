//
//  ConstraintsViewController.h
//  AutoLayout
//
//  Created by Scott Doxey on 10/1/13.
//  Copyright (c) 2013 Scott Doxey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConstraintsViewController : UIViewController

- (void)setConstraintsForViews:(NSDictionary *)views inView:(UIView *)view visualFormats:(NSArray *)visualFormats metrics:(NSDictionary *)metrics options:(NSLayoutFormatOptions)options;

- (void)setConstraintsForViews:(NSDictionary *)views visualFormats:(NSArray *)visualFormats metrics:(NSDictionary *)metrics options:(NSLayoutFormatOptions)options;

@end
