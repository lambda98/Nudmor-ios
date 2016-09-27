//
//  HospitalViewController.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/20/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Daysquare/Daysquare.h"

@protocol MakeBookingDelegate <NSObject>

- (void)setBookingDetail:(NSString *)detail;

@end

@interface HospitalViewController : UIViewController

@property id<MakeBookingDelegate> delegate;
@property (strong, nonatomic) IBOutlet DAYCalendarView *calendarView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *calendarHeightConstraint;


@end
