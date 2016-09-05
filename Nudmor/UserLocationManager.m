//
//  UserLocationManager.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 9/5/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "UserLocationManager.h"

@implementation UserLocationManager

+ (id)sharedManager
{
    static UserLocationManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

- (id)init
{
    if(self = [super init])
    {
        
    }
    
    return self;
}

- (void)updateUserLocation:(CLLocation *)location
{
    userLocation = location;
    NSLog(@"Location: %f %f", userLocation.coordinate.latitude, userLocation.coordinate.longitude);
}

- (CLLocation *)getUserLocation
{
    return userLocation;
}

@end
