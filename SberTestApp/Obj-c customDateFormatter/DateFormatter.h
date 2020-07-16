//
//  myCustomFormatter.h
//  SberTestApp
//
//  Created by Никита Хуснутдинов on 7/17/20.
//  Copyright © 2020 Никита Хуснутдинов. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjCDateFormatter : NSObject

-(NSString *) getDateStringFrom: (NSDate *)date;
-(void) setFormat: (NSString *)textFormat;

@end
