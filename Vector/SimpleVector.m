//
//  SimpleVector.m
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:1
//
//  Copyright (c) 2015 Ekta Mahajan. All rights reserved.
//

#import "SimpleVector.h"

@implementation SimpleVector

{
  @private NSMutableArray *ra; // Declare NSMutableArray
}

//Declare synthesize
@synthesize size, capacity;

// Initialization of variables
-(instancetype)init
{
    if (self = [super init])
    {
        
        ra = [[NSMutableArray alloc] init]; // Alloc memory & initilize NSMutableArray
        capacity = 10;
        size = 0;
    }
    return self;
}

//Define primary methods or actions

//add item e at end of array, reallocating if needed
-(BOOL)add: (id)e
{
    NSMutableArray *tmp;
    if (size == capacity)
    {
       tmp = [[NSMutableArray alloc] initWithCapacity: 2*capacity];
        capacity *= 2;
        for ( int i = 0;  i < size;  ++i )
        [tmp arrayByAddingObject:ra];
        ra = tmp;
    }
   
   [ra insertObject:e atIndex:size++];
    return YES;
}

// return element at given index
-(id)get:(int)index
{
    if (index >= 0 && index < size )
    {
    return ra[index];
    }
    else
    return nil;
}

// return index of array
-(int)indexOf: (id) o
{
    for ( int i = 0; i < size; i++ )
    if ( o== NULL ? ra[i]== NULL : o == ra[i] )
    return i;
    return -1;
}

// remove elements from array
-(BOOL)remove:(id)o
{
   int index = [self indexOf:o];
    if ( index >= 0 )
    {
            for ( int i = index+1;  i < size;  ++i )
                ra[i-1] =ra[i];
        --size;
        return YES;
    }
    else
    return NO;
}

// return size of the array
-(int)Size
{
    return size;
}

// To check if array is empty
-(BOOL)isEmpty
{
    if(size == 0)
    return YES;
    return NO;
}

// string-ization and I/O
- (NSString *) description
{
        id string;
        for(int i = 0; i < [self Size]; ++i)
        {
        string= [NSString stringWithFormat: @"%@", [self get:i]];
        }
    return string;
}

- (void) print
{
    for(int i = 0; i < [self Size]; ++i)
    {
        NSLog(@"Item at index %i = %@", i, [self get:i]);
    }
}

@end
