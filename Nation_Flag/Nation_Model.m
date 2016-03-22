//
//  Nation_Model.m
//  Nation_Flag
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:2
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import "Nation_Model.h"

@interface Nation_Model ()

// Declare arrays
@property (strong,nonatomic)  NSArray *countryNameArray;
@property (strong,nonatomic)  NSArray *flagNameArray;

@end


@implementation Nation_Model

// Define arrays
- (id) init
{
    if ( self = [super init] )
    {
        self.countryNameArray = @[
                             @"India",
                             @"USA",
                             @"Australia",
                             @"China",
                             @"Bangladesh",
                             @"North Korea",
                             @"Sri Lanka",
                             @"Canada",
                             @"Mexico",
                             @"Brazil"];
        
        self.flagNameArray = @[
                              @"Asia-India.png",
                              @"North_America-USA.png",
                              @"Oceania-Australia.png",
                              @"Asia-China.png",
                              @"Asia-Bangladesh.png",
                              @"Asia-North_Korea.png",
                              @"Asia-Sri_Lanka.png",
                              @"North_America-Canada.png",
                              @"North_America-Mexico.png",
                              @"South_America-Brazil.png"];
    }
    return self;
}

// Define functions

- (NSString *) countryName : (NSInteger) countryIndex
{
    return [self.countryNameArray objectAtIndex:countryIndex];
}

- (NSString *) flagName : (NSInteger) flagIndex
{
    return [self.flagNameArray objectAtIndex:flagIndex];
}

-(NSUInteger) maxIndex
{
    return [self.countryNameArray count];
}

@end
