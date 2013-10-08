#CoreLocation.framework

###Getting Latitude/Longitude

```objc
// ViewController.h

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@end
```

```objc
// ViewController.m

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
{
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager startMonitoringSignificantLocationChanges]; // Low frequency updates
    // [locationManager startUpdatingLocation]; // High frequency updates

}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    NSLog(@"%@", [NSString stringWithFormat:@"%.8f, %.8f",
                  newLocation.coordinate.latitude,
                  newLocation.coordinate.longitude]
          );

}

@end
```

###Getting City, State, Zip, Country

```objc
// ViewController.h

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@end
```

```objc
// ViewController.m

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
{
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
    [locationManager startMonitoringSignificantLocationChanges]; // Low frequency updates based on movement)
    // [locationManager startUpdatingLocation]; // High frequency updates (based on movement)

}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];

    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {

        CLPlacemark *place = [placemarks objectAtIndex:0];

        NSLog(@"%@, %@, %@, %@", [place locality], [place administrativeArea], [place postalCode], [place country]);

    }];

}

@end
```

###Getting Address

```objc
// ViewController.h

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@end
```

```objc
// ViewController.m

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
{
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
    [locationManager startMonitoringSignificantLocationChanges]; // Low frequency updates based on movement)
    // [locationManager startUpdatingLocation]; // High frequency updates (based on movement)

}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];

    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {

        CLPlacemark *place = [placemarks objectAtIndex:0];

        NSLog(@"%@", [[[place addressDictionary] valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@"\n"]);

    }];

}

@end
```