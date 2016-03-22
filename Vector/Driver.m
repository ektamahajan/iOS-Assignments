//
//  Driver.m
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:1
//
//  Copyright (c) 2015 Ekta Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleVector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Declare instance of class SimpleVector, alloc memory & initilize it.
        SimpleVector *a = [[SimpleVector alloc] init];
        
            NSLog(@"Testing Started");
        
        // show initial size and capacity of SimpleVector a.
            NSLog(@"Size of SimpleVector a:%i",[a Size]);
        
        // To add 10 items to SimpleVector a
        for (int i = 0;  i < 10;  ++i )
        {
            [a add:[NSNumber numberWithInt:i]];
            NSLog(@"Added %i, Size of SimpleVector a:%i", i, [a Size]);
        }
        
        //Display elements in the array
        for ( int i = 0;  i < [a Size];  ++i )
            NSLog(@"Item at index %i = %@", i, [a get:i]);
        
        // remove an item from SimpleVector a
        id elt = [a get:5];
        bool k = [a remove:[a get:5]];
        if (k)
        {
            NSLog(@"Removed item at index %@, Size of SimpleVector a: %i",elt,[a Size]);
        }
        else
        {
            NSLog(@"Failed to remove item at index %@, Size of SimpleVector a: %i",elt,[a Size]);
        }
        
        //Display elements in the array
        for ( int i = 0;  i < [a Size];  ++i )
            NSLog(@"Item at index %i = %@", i, [a get:i] );
        
        // insert an item at a particular position in SimpleVector a
        [a add: [NSNumber numberWithInt:999]];
            NSLog(@"Added %i at index %i, Size of SimpleVector a: %i", 999, [a indexOf: [NSNumber numberWithInt:999]], [a Size]);
        
        //Display elements in the array
        for ( int i = 0;  i < [a Size];  ++i )
            NSLog(@"Item at index %i = %@", i, [a get:i]);
        
        // clear out SimpleVector a
        while ( [a Size] != 0 )
               [a remove:[a get:[a size]-1] ];
        
        // check clear
        if ( [a isEmpty] )
            NSLog(@"SimpleVector a is now empty" );
        else
            NSLog(@"SimpleVector a now contains %i items", [a Size]);
        
    }
    return 0;
}





