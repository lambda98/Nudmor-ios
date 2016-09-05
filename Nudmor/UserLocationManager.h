//
//  UserLocationManager.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 9/5/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface UserLocationManager : NSObject
{
    CLLocation *userLocation;
}

- (void)updateUserLocation:(CLLocation *)location;
- (CLLocation *)getUserLocation;

+ (id)sharedManager;

@end
