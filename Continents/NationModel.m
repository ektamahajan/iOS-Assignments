//
//  Nation_Model.m
//  Continents
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:3
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import "NationModel.h"


@interface NationModel ()

// Declare arrays
@property (strong,nonatomic) NSArray *array, *tempContinent;

@end


@implementation NationModel


- (id) init
{
    
    if ( self = [super init] )
    {
         self.tempContinent = [NSArray arrayWithObjects:@"Africa",@"Asia",@"Europe",@"North_America",@"South_America",@"Oceania", nil];
        
        // creation of Bundle & directories
        NSString *bundlePathName = [[NSBundle mainBundle] bundlePath];
        NSString *dataPathName = [bundlePathName stringByAppendingPathComponent:@"Flags"];
        NSError  *error;
        NSArray *flagNameArray = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dataPathName error:&error];
        
        for(id temp in flagNameArray)
        {
            
            self.array = [temp componentsSeparatedByString:@"-" ];
            NSString *filePathName = [dataPathName stringByAppendingPathComponent:[self.array objectAtIndex:0]];
            
            if (![[NSFileManager defaultManager] fileExistsAtPath:filePathName])
            {
               [[NSFileManager defaultManager] createDirectoryAtPath:filePathName withIntermediateDirectories:YES attributes:nil error:nil];
                
            }
            NSString *FlagsPathName = [dataPathName stringByAppendingPathComponent:temp];
            NSString *PathName = [filePathName stringByAppendingPathComponent:temp];

            [[NSFileManager defaultManager] copyItemAtPath:FlagsPathName toPath:PathName error:&error];

        }
    }
    return self;
}

// Define functions

- (NSArray *) countryName : (NSInteger) countryIndex
{
    NSMutableArray *countryNameArray = [[NSMutableArray alloc]init];
    NSString *bundlePathName = [[NSBundle mainBundle] bundlePath];
    NSString *dataPathName = [bundlePathName stringByAppendingPathComponent:@"Flags"];
    NSString *filesPathName = [dataPathName stringByAppendingPathComponent:[self.tempContinent objectAtIndex:countryIndex]];
    NSError *error;
    NSArray *fileNames =[[NSFileManager defaultManager] contentsOfDirectoryAtPath:filesPathName error:&error];
  
    
    for(id temp1 in fileNames)
    {
    
        if ([[temp1 pathExtension] isEqual:@"png"]) {
    NSArray *array1 = [temp1 componentsSeparatedByString:@"-" ];
      
    NSString *str = [[[array1 objectAtIndex:1] lastPathComponent]stringByDeletingPathExtension];
    
    [countryNameArray addObject:str];
    
    }
    }
    return countryNameArray;
}

- (NSArray *) flagName : (NSInteger) flagIndex
{
    NSMutableArray *flagName = [[NSMutableArray alloc]init];
    NSString *bundlePathName = [[NSBundle mainBundle] bundlePath];
    NSString *dataPathName = [bundlePathName stringByAppendingPathComponent:@"Flags"];

    NSString *filesPathName = [dataPathName stringByAppendingPathComponent:[self.tempContinent objectAtIndex:flagIndex]];
    NSError  *error;
    NSArray *fileNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filesPathName error:&error];
    
    for(id temp3 in fileNames)
    {
        if ([[temp3 pathExtension] isEqual:@"png"])
        {
            [flagName addObject:temp3];
        }
    }
   return flagName;
        
}





@end
