//
//  TableViewController.m
//  Continents
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:3
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"


@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // declare array of coninents
    self.continent = [NSArray arrayWithObjects:@"Africa",@"Asia",@"Europe",@"North_America",@"South_America",@"Oceania", nil];
    
    // to display the title of controller
    self.title = @"Choose a Continent";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// To display sections in the tabel view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

// To display the number of rows in a section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.continent.count;
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // create new cell if nil
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // set text attribute of cell
    cell.textLabel.text = [self.continent objectAtIndex:indexPath.row];
    
    // set accessory type
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

//View Controller - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    [super prepareForSegue:segue sender:sender];
    
    // pick up destination view controller from segue object
      ViewController *vc = segue.destinationViewController;
    
      NSIndexPath *path = self.tableView.indexPathForSelectedRow;
      NSString *continent = [self.continent objectAtIndex:path.row];
    
       vc.itemNumber = path.row;
       vc.itemName = continent;
}


@end



