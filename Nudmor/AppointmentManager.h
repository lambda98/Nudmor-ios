//
//  AppointmentManager.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/22/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appointment.h"

@interface AppointmentManager : NSObject {
    NSArray *appointments;
    Appointment *currentAppointment;
}

@property (nonatomic, retain) NSArray *appointments;
@property (nonatomic, retain) Appointment *currentAppointment;

+ (id)sharedManager;

@end
