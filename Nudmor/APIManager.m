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
    NSString *url = @"http://128.199.191.61:9000/api/v1/symptoms";
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

- (NSDictionary *)getHospitalTimeTable:(int)hospitalId withDate:(NSString *)date
{
    NSString *url = [NSString stringWithFormat:@"http://128.199.191.61:9000/api/v1/hospitals/%d/date/%@", hospitalId, date];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return json;
}

- (NSDictionary *)createBooking:(Appointment *)appointment
{
    NSURL *url = [NSURL URLWithString:@"http://128.199.191.61:9000/api/v1/bookings"];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
                         appointment.name, @"name",
                         appointment.surname, @"surname",
                         appointment.email, @"email",
                         appointment.mobileNo, @"mobile",
                         appointment.timeSlotId, @"hospitalTimeId",
                         appointment.symptomId, @"symptomId",
                         nil];
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:tmp options:0 error:&error];
    NSLog(@"%@",  [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
    [request setHTTPBody:postData];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:requestHandler options:0 error:&error];
    NSLog(@"resposne dicionary is %@",responseDictionary);
    
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    NSLog(@"requestReply: %@", requestReply);
    
    return nil;
}

@end
