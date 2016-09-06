//
//  SymptomViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/15/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "SymptomViewController.h"
#import "APIManager.h"

@interface SymptomViewController ()

@end

@implementation SymptomViewController
{
    NSMutableArray *items;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //items = [NSArray arrayWithObjects:@"Common Symptoms", @"Headache", @"Common cold", @"Sore throat", @"Fever", @"Cough", @"Dizziness", @"Diarrhea", @"Chest pain", @"Earache", @"Skin rashes", @"Hip pain", @"Knee pain", @"Low back pain", @"Neck pain", nil];
    items = [[NSMutableArray alloc] init];
    [items addObject:@"Common Symptoms"];
    
    APIManager *apiManager = [[APIManager alloc] init];
    
    NSDictionary *json = [apiManager getAllSymptoms];
    
    NSLog(@"%@", json);
    [items addObjectsFromArray:[[json valueForKey:@"symptoms"] valueForKey:@"name"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SymptomHeaderCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    if(indexPath.row == 0)
    {
        cell.textLabel.font = [UIFont boldSystemFontOfSize:24.0];
    }
    
    return cell;
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
