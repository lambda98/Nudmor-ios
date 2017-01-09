//
//  UserInfoViewController.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 10/30/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppointmentManager.h"

@interface UserInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *mobileNo;

@end
