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
{
    NSMutableArray *timeTable;
    NSMutableArray *timeTableId;
    int hospitalId;
    APIManager *apiManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //timeTable = [NSMutableArray arrayWithObjects:@"10.00 - 11.00", @"11.00 - 12.00", @"13.00 - 14.00", @"14.00 - 15.00", @"15.00 - 16.00", @"16.00 - 17.00", nil];
    apiManager = [[APIManager alloc] init];
    
    hospitalId = self.hospital.hospitalId.intValue;
    self.hospitalNameLabel.text = self.hospital.hospitalName;
    
    [self.calendarView addTarget:self action:@selector(calendarViewDidChange:) forControlEvents:UIControlEventValueChanged];
    self.calendarHeightConstraint.constant = 100;
    self.calendarView.singleRowMode = YES;
}

- (void)calendarViewDidChange:(id)sender {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd";
    NSString *date = [formatter stringFromDate:self.calendarView.selectedDate];
    NSLog(@"%@", date);
    
    NSDictionary *result = [apiManager getHospitalTimeTable:hospitalId withDate:date];
    NSArray *timetableList = [[NSArray alloc] initWithArray:[result valueForKey:@"time_slots"]];
    
    //timeTable = [NSMutableArray arrayWithObjects:@"10.00 - 11.00", @"11.00 - 12.00", @"13.00 - 14.00", @"14.00 - 15.00", @"15.00 - 16.00", @"16.00 - 17.00", nil];
    
    timeTable = [timetableList valueForKey:@"time_slot"];
    timeTableId = [timetableList valueForKey:@"id"];
    
    [self.hospitalTimeTable reloadData];
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
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YYYY-MM-dd";
    NSLog(@"%@", [formatter stringFromDate:self.calendarView.selectedDate]);
    
    [self dismissCurrentView];
}

- (void)dismissCurrentView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [timeTable count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [timeTable objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    AppointmentManager *manager = [AppointmentManager sharedManager];
    
    NSString *timeSlotText = [timeTable objectAtIndex:indexPath.row];
    NSString *timeSlotId = [timeTableId objectAtIndex:indexPath.row];
    
    manager.currentAppointment.timeSlot = timeSlotText;
    manager.currentAppointment.timeSlotId = timeSlotId;
    
    NSLog(@"%@ %@", timeSlotId, timeSlotText);
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
