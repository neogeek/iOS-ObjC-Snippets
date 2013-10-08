#MapKit.framework

###Basic Map Setup

```objc
// ViewController.m

#import "ViewController.h"
#import <MapKit/MapKit.h>

@implementation ViewController

- (void)viewDidLoad
{

    MKMapView *map = [[MKMapView alloc] initWithFrame:self.view.frame];

    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    [point setCoordinate:CLLocationCoordinate2DMake(37.78583400, -122.40641700)];
    [point setTitle:@"Apple Store"];

    [map addAnnotation:point];

    CLLocationCoordinate2D appleStoreLocation = CLLocationCoordinate2DMake(37.78583400, -122.40641700);

    [map setRegion:MKCoordinateRegionMake(appleStoreLocation, MKCoordinateSpanMake(0.001, 0.001)) animated:YES];

    [self.view addSubview:map];

}

@end
```

###Adding a new Pin Per Location Update (Using [CoreLocation.framework](CoreLocation.framework.md))

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
#import <MapKit/MapKit.h>

@interface ViewController ()
{
    MKMapView *map;
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad
{

    map = [[MKMapView alloc] initWithFrame:self.view.frame];

    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];

    [self.view addSubview:map];

}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    [point setCoordinate:newLocation.coordinate];
    [point setTitle:@"Current Location"];

    [map setRegion:MKCoordinateRegionMake(newLocation.coordinate, MKCoordinateSpanMake(0.01, 0.01)) animated:YES];

    [map addAnnotation:point];

}

@end
```