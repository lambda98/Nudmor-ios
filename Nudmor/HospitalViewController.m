//
//  HospitalViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/20/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "HospitalViewController.h"

@interface HospitalViewController ()

@end

@implementation HospitalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)dismissButtonClicked:(id)sender {
    [self dismissCurrentView];
}
- (IBAction)makeBooking:(id)sender {
    [self.delegate setBookingDetail:@"foo"];
    [self dismissCurrentView];
}

- (void)dismissCurrentView {
    [self dismissViewControllerAnimated:YES completion:nil];
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
