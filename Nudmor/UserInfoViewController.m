//
//  UserInfoViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 10/30/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowBookingSummary"])
    {
        AppointmentManager *manager = [AppointmentManager sharedManager];
        manager.currentAppointment.email = self.email.text;
        manager.currentAppointment.mobileNo = self.mobileNo.text;
        manager.currentAppointment.name = self.firstName.text;
        manager.currentAppointment.surname = self.lastName.text;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
