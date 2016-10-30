//
//  SecondViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/15/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "AppointmentViewController.h"
#import "AppointmentCell.h"
#import "AppointmentManager.h"

@interface AppointmentViewController ()

@property (strong, nonatomic) IBOutlet UITableView *appointmentTable;
@property (strong, nonatomic) IBOutlet UILabel *emptyAppointmentLabel;

@end

@implementation AppointmentViewController

@synthesize appointments;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppointmentManager *manager = [AppointmentManager sharedManager];
    appointments = manager.appointments;
    
    if(appointments == nil)
    {
        [self.appointmentTable setHidden:YES];
    }
    else
    {
        [self.emptyAppointmentLabel setHidden:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(appointments == nil)
    {
        return 0;
    }
    else
    {
        return appointments.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppointmentCell" forIndexPath:indexPath];
    
    cell.dateLabel.text = @"31";
    cell.monthLabel.text = @"OCT";
    cell.hospitalLabel.text = @"โรงพยาบาลบำรุงราษฎร์";
    cell.timeLabel.text = @"11.00";
    
    return cell;
}

- (void)addAppointment
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
