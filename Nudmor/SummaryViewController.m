//
//  SummaryViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/21/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "SummaryViewController.h"
#import "AppointmentManager.h"
#import "APIManager.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppointmentManager *manager = [AppointmentManager sharedManager];
    
    self.hospitalName.text = manager.currentAppointment.hospitalName;
    self.dateAndTime.text = [NSString stringWithFormat:@"%@ %@ %@ %@", manager.currentAppointment.date, manager.currentAppointment.month, manager.currentAppointment.year, manager.currentAppointment.timeSlot];
    self.symptomName.text = manager.currentAppointment.symptomName;
    self.userName.text = manager.currentAppointment.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)confirmBooking:(id)sender {
    
    AppointmentManager *manager = [AppointmentManager sharedManager];
    
    UIView *overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [overlay setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];
    
    [self.navigationController.view addSubview:overlay];
    
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, false);
    
    APIManager *api = [[APIManager alloc] init];
    [api createBooking:manager.currentAppointment];
    
    //AppointmentManager *manager = [AppointmentManager sharedManager];
    manager.appointments = [NSArray arrayWithObjects:manager.currentAppointment, nil];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //UIViewController *appointmentViewController = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentView"];
    
    UIViewController *navigationController = [storyboard instantiateInitialViewController];
    navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:navigationController animated:YES completion:nil];
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
