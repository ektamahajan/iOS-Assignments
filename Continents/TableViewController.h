//
//  TableViewController.h
//  Continents
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:3
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

// Declare Protocols
<UITableViewDataSource,UITableViewDataSource>

@property (nonatomic, strong) NSArray *continent; // declare array of continents

@end
