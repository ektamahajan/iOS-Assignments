//
//  Nation_Model.h
//  Nation_Flag
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:2
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Nation_Model : NSObject

// Declare functions
- (NSString *) countryName : (NSInteger) countryNameIndex;
- (NSString *) flagName : (NSInteger) flagNameIndex;
- (NSUInteger) maxIndex;

@end
