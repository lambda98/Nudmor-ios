//
//  AppointmentManager.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/22/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppointmentManager : NSObject {
    NSArray *appointments;
}

@property (nonatomic, retain) NSArray *appointments;

+ (id)sharedManager;

@end
