//
//  SymptomViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/15/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "SymptomViewController.h"
#import "APIManager.h"
#import "AppointmentManager.h"
#import "Appointment.h"

@interface SymptomViewController ()

@end

@implementation SymptomViewController
{
    NSMutableArray *symptomNames;
    NSMutableArray *symptomIds;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //items = [NSArray arrayWithObjects:@"Common Symptoms", @"Headache", @"Common cold", @"Sore throat", @"Fever", @"Cough", @"Dizziness", @"Diarrhea", @"Chest pain", @"Earache", @"Skin rashes", @"Hip pain", @"Knee pain", @"Low back pain", @"Neck pain", nil];
    symptomNames = [[NSMutableArray alloc] init];
    symptomIds = [[NSMutableArray alloc] init];
    [symptomNames addObject:@"Common Symptoms"];
    
    APIManager *apiManager = [[APIManager alloc] init];
    
    NSDictionary *json = [apiManager getAllSymptoms];
    
    NSLog(@"%@", json);
    [symptomNames addObjectsFromArray:[[json valueForKey:@"symptoms"] valueForKey:@"name"]];
    [symptomIds addObjectsFromArray:[[json valueForKey:@"symptoms"] valueForKey:@"id"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [symptomNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SymptomHeaderCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [symptomNames objectAtIndex:indexPath.row];
    
    if(indexPath.row == 0)
    {
        cell.textLabel.font = [UIFont boldSystemFontOfSize:24.0];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppointmentManager *manager = [AppointmentManager sharedManager];
    manager.currentAppointment = [[Appointment alloc] init];
    
    NSString *symptomName = [symptomNames objectAtIndex:indexPath.row];
    NSString *symptomId = [symptomIds objectAtIndex:indexPath.row];
    
    NSLog(@"%@ %@", symptomId, symptomName);
    
    manager.currentAppointment.symptomId = symptomId;
    manager.currentAppointment.symptomName = symptomName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
