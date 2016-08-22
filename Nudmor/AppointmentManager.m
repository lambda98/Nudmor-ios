//
//  AppointmentManager.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/22/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "AppointmentManager.h"

@implementation AppointmentManager

@synthesize appointments;

+ (id)sharedManager
{
    static AppointmentManager *sharedManager = nil;
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

@end
