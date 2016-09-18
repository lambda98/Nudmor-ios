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
@synthesize searchLocation;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [resultMap setDelegate:self];
    
    NSLog(@"Search Location: %f %f", searchLocation.coordinate.latitude, searchLocation.coordinate.longitude);
    
    APIManager *apiManager = [[APIManager alloc] init];
    NSDictionary *hospitals = [apiManager searchHospitals:searchLocation];
    
    
    NSArray *hospitalList = [[NSArray alloc] initWithArray:[hospitals valueForKey:@"hospitals"]];
    
    NSLog(@"%@",[[hospitalList objectAtIndex:0] valueForKey:@"latitude"]);
    
    MKCoordinateRegion region;
    
    NSUInteger numberOfResultToShow = 3;
    
    double maxLongitude = 0;
    double minLongitude = 0;
    double maxLatitude = 0;
    double minLatitude = 0;
    
    if (hospitalList.count < 3)
    {
        numberOfResultToShow = hospitalList.count;
    }
    
    for(int i = 0; i < numberOfResultToShow; i++)
    {
        NSDictionary *hospital = [hospitalList objectAtIndex:i];
        double latitude = [[hospital valueForKey:@"latitude"] doubleValue];
        double longitude = [[hospital valueForKey:@"longitude"] doubleValue];
        
        if(i == 0)
        {
            region.center.latitude = latitude;
            region.center.longitude = longitude;
            
            maxLatitude = latitude;
            minLatitude = latitude;
            maxLongitude = longitude;
            minLongitude = longitude;
        }
        else
        {
            if(latitude > maxLatitude)
            {
                maxLatitude = latitude;
            }
            else if(latitude < minLatitude)
            {
                minLatitude = latitude;
            }
            
            if(longitude > maxLongitude)
            {
                maxLongitude = longitude;
            }
            else if (longitude < minLongitude)
            {
                minLongitude = longitude;
            }
        }
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        [annotation setCoordinate:CLLocationCoordinate2DMake(latitude, longitude)];
        [annotation setTitle:[hospital valueForKey:@"name"]];
        [annotation setSubtitle:@"10.00 - 17.30"];
        
        [resultMap addAnnotation:annotation];
        
        if(i == 0)
        {
            [resultMap selectAnnotation:annotation animated:YES];
        }
    }
    
    MKCoordinateSpan span;
    span.latitudeDelta = (maxLatitude - minLatitude) * 3;
    span.longitudeDelta = maxLongitude - minLongitude;
    
    region.span = span;
    
    resultMap.region = region;
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
