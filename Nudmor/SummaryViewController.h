//
//  SummaryViewController.h
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 8/21/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *hospitalName;
@property (strong, nonatomic) IBOutlet UILabel *dateAndTime;
@property (strong, nonatomic) IBOutlet UILabel *symptomName;
@property (strong, nonatomic) IBOutlet UILabel *userName;

@end
