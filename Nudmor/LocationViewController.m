//
//  LocationViewController.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/16/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController
{
    NSArray *locations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    locations = [NSArray arrayWithObjects:@"Use my location", @"Saved Places", @"Home", @"Work", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [locations count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [locations objectAtIndex:indexPath.row];
    
    if(indexPath.row == 1)
    {
        cell.textLabel.font = [UIFont boldSystemFontOfSize:24.0];
    }
    
    return cell;
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
