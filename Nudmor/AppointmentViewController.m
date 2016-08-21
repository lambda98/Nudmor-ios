//
//  SecondViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/15/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "AppointmentViewController.h"
#import "AppointmentCell.h"

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
    
    if(appointments == nil)
    {
        //[self.appointmentTable setHidden:YES];
        [self.emptyAppointmentLabel setHidden:YES];
    }
    else
    {
        [self.emptyAppointmentLabel setHidden:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(appointments == nil)
    {
        return 1;
    }
    else
    {
        return appointments.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppointmentCell" forIndexPath:indexPath];
    
    cell.dateLabel.text = @"30";
    cell.monthLabel.text = @"SEP";
    cell.hospitalLabel.text = @"Simitivej Hospital";
    cell.timeLabel.text = @"11.00";
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
