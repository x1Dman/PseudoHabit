//
//  myCustomFormatter.m
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/17/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

#import "DateFormatter.h"

@interface ObjCDateFormatter()
@property (strong, nonatomic) NSString *_textFormat;
@end

@implementation ObjCDateFormatter

-(NSString *) getDateStringFrom: (NSDate *)date {
    // alloc memory for dateformatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: __textFormat];
    NSString *returnValue = [dateFormatter stringFromDate: date];
    return returnValue;
}
- (void) setFormat:(NSString *)text {
    __textFormat = text;
}

@end

