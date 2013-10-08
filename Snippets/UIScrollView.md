#UIScrollView

```objc
// ViewController.m

- (void)viewDidLoad
{

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];

    UITextView *descriptionText = [[UITextView alloc] init];
    [descriptionText setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [descriptionText setEditable:NO];
    [scrollView addSubview:descriptionText];

    for (int i = 0; i < 10; i = i + 1) {

        descriptionText.text = [descriptionText.text stringByAppendingString:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "];

    }

    CGSize textSize = [descriptionText sizeThatFits:CGSizeMake(300, FLT_MAX)];

    [descriptionText setFrame:CGRectMake(10, 40, 300, textSize.height + 40)];

    [scrollView setContentSize:CGSizeMake(320, descriptionText.frame.size.height + 40)];

    [self.view addSubview:scrollView];

}
```

###UIScrollView w/ Pages and Pagination

```objc
// ViewController.h

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;

@end
```

```objc
// ViewController.m

- (void)viewDidLoad
{

    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];

    CGSize viewSize = self.scrollView.frame.size;

    int length = 10;

    [self.scrollView setContentSize:CGSizeMake(viewSize.width * length, viewSize.height)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:NO];
    [self.scrollView setDelegate:self];
    [self.view addSubview:self.scrollView];

    for (int i = 0; i < length; i = i + 1) {

        UIViewController *viewController = [[UIViewController alloc] init];
        [viewController.view setFrame:CGRectMake(viewSize.width * i, 0, viewSize.width, viewSize.height)];
        [viewController.view setBackgroundColor:[UIColor colorWithRed:((155 - (i * 10))/255.0)
                                                                green:((225 - (i * 10))/255.0)
                                                                 blue:((205 - (i * 10))/255.0)
                                                                alpha:1]];
        [self.scrollView addSubview:viewController.view];

    }

    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, viewSize.height - 20, viewSize.width, 10)];
    [self.pageControl setNumberOfPages:length];
    [self.pageControl addTarget:self action:@selector(updateScollViewPosition:) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:self.pageControl];

}

- (void)updateScollViewPosition:(UIPageControl*)control
{

    CGSize viewSize = self.scrollView.frame.size;

    [self.scrollView scrollRectToVisible:CGRectMake(control.currentPage * viewSize.width, 0, viewSize.width, viewSize.height) animated:YES];

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    float width = [[self.scrollView subviews][0] frame].size.width;

    [self.pageControl setCurrentPage:(self.scrollView.contentOffset.x / width)];

}
```