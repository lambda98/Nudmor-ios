//
//  APIManager.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 9/3/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Appointment.h"

@interface APIManager : NSObject

- (NSDictionary *)getAllSymptoms;
- (NSDictionary *)searchHospitals:(CLLocation *)location;
- (NSDictionary *)getHospitalTimeTable:(int) hospitalId withDate:(NSString *)date;
- (NSDictionary *)createBooking:(Appointment *)appointment;

@end
