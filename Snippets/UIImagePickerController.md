#UIImagePickerController

```objc
// ViewController.h

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end
```

```objc
// ViewController.m

@interface ViewController ()
{
    UIImagePickerController *imagePicker;
    UIImageView *selectedImage;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(100, 50, 120, 44)];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"Select Image" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];

    selectedImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, 300)];
    [selectedImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:selectedImage];

}

- (void)buttonPressed:(UIButton *)sender;
{

    [self presentViewController:imagePicker animated:YES completion:nil];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{

    [selectedImage setImage:[info objectForKey:UIImagePickerControllerOriginalImage]];

    [picker dismissViewControllerAnimated:YES completion:nil];

}

@end
```