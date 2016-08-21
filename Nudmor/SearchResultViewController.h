//
//  SearchResultViewController.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/16/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "HospitalViewController.h"

@interface SearchResultViewController : UIViewController<MakeBookingDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *resultMap;

@end
