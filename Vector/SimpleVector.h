//
//  SimpleVector.h
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:1
//.
//  Copyright (c) 2015 Ekta Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleVector: NSObject

//Define Properties
@property int size, capacity;

//Declare constructor
-(instancetype) init;

//Declare primary methods & actions
-(BOOL) add :(id) e;
-(id) get: (int) index;
-(int) indexOf: (id) o;
-(BOOL) remove: (id) o;
-(int) Size;
-(BOOL) isEmpty;


// string-ization and I/O
- (NSString *) description;
- (void) print;


@end
