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
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *hospitalName;

@end
