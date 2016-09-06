//
//  APIManager.m
//  Nudmor
//
//  Created by Nuttarut Phugsuwan on 9/3/2559 BE.
//  Copyright © 2559 Nudmor Foundation. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

- (NSDictionary *)getAllSymptoms
{
    NSError *error;
    NSString *url = @"http://128.199.191.61:9000/api/v1/symptom";
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return json;
}

- (NSDictionary *)searchHospitals:(CLLocation *)location
{
    NSString *url = [NSString stringWithFormat:@"http://128.199.191.61:9000/api/v1/hospitals/location/%f,%f", location.coordinate.latitude, location.coordinate.longitude];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return json;
}

@end
