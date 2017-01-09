//
//  LocationViewController.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/16/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "UserLocationManager.h"
#import "SearchResultViewController.h"

@interface LocationViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) IBOutlet UITableView *locationTable;
@property (strong, nonatomic) IBOutlet UILabel *symptomName;

@end
