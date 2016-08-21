//
//  SearchResultViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/16/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "SearchResultViewController.h"
#import "HospitalViewController.h"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

@synthesize resultMap;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [resultMap setDelegate:self];
    
    MKCoordinateRegion region;
    region.center.latitude = 13.7396728;
    region.center.longitude = 100.5611107;
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:CLLocationCoordinate2DMake(13.7396728, 100.5611107)];
    [annotation setTitle:@"Simitivej Hospital"];
    [annotation setSubtitle:@"10.00 - 17.30"];
    
    MKPointAnnotation *annotation2 = [[MKPointAnnotation alloc] init];
    [annotation2 setCoordinate:CLLocationCoordinate2DMake(13.7427315, 100.5605466)];
    [annotation2 setTitle:@"Siriraj Hospital"];
    [annotation2 setSubtitle:@"13.30 - 21.30"];
    
    MKPointAnnotation *annotation3 = [[MKPointAnnotation alloc] init];
    [annotation3 setCoordinate:CLLocationCoordinate2DMake(13.735689, 100.561605)];
    [annotation3 setTitle:@"Ramkhamhang Hospital"];
    [annotation3 setSubtitle:@"7.30 - 18.30"];
    
    MKCoordinateSpan span;
    double radius = 1 / 1000;
    span.latitudeDelta = 0.00725;//radius / 112.0;
    span.longitudeDelta = 0.00725;
    
    region.span = span;
    
    resultMap.region = region;
    [resultMap addAnnotation:annotation];
    [resultMap selectAnnotation:annotation animated:YES];
    
    [resultMap addAnnotation:annotation2];
    //[mapView selectAnnotation:annotation2 animated:YES];
    
    [resultMap addAnnotation:annotation3];
}

- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    
    MKPinAnnotationView *annotationView = [aMapView dequeueReusableAnnotationViewWithIdentifier:@"String"];
    if(!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"String"];
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
    }
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"tapped");
    
    [self performSegueWithIdentifier:@"ShowHospital" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowHospital"])
    {
        HospitalViewController *desViewController = segue.destinationViewController;
        desViewController.delegate = self;
    }
}

- (void)setBookingDetail:(NSString *)detail
{
    NSLog(@"booking %@", detail);
    [self performSegueWithIdentifier:@"ShowBookingDetail" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
