#UICollectionView

```objc
// ViewController.h

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end
```

```objc
// ViewController.m

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                                          collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];

    [collectionView setDataSource:self];
    [collectionView setDelegate:self];

    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    [collectionView setBackgroundColor:[UIColor greenColor]];

    [self.view addSubview:collectionView];

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    [cell setBackgroundColor:[UIColor blueColor]];

    return cell;

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}

@end
```