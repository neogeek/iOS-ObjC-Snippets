//
//  ContraintsViewController.h
//  AutoLayout
//
//  Created by Scott Doxey on 10/1/13.
//  Copyright (c) 2013 Scott Doxey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContraintsViewController : UIViewController

- (void)setConstraintsForViews:(NSDictionary *)views visualFormats:(NSArray *)visualFormats metrics:(NSDictionary *)metrics options:(NSLayoutFormatOptions)options;

@end
