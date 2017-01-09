//
//  Appointment.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/21/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Appointment : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *month;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *timeSlot;
@property (nonatomic, copy) NSString *timeSlotId;
@property (nonatomic, copy) NSString *hospitalName;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *surname;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *mobileNo;
@property (nonatomic, copy) NSString *symptomName;
@property (nonatomic, copy) NSString *hospitalTimeId;
@property (nonatomic, copy) NSString *symptomId;

@end
