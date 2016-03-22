//
//  ViewController.m
//  Country_Location
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:4
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "NationModel.h"

@interface ViewController ()

@property (strong,nonatomic) NationModel *model; // declare object of model
// declare variables
@property (assign) NSInteger flagIndex;
@property (strong, nonatomic) NSArray *coordinates;
@property(assign)double latitude;
@property (assign)double longitude;

@end

@implementation ViewController


CLLocationManager *mgr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Define model
- (NationModel *) model
{
    if (!_model)
        _model = [[NationModel alloc] init];
    return _model;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.nameOfFlag = [[NSMutableArray alloc]init];
    self.nameOfCountry = [[NSMutableArray alloc]init];
    
    // To set background color
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // To connect data of TextField & PickerView
    self.countryText.delegate =self;
    
    self.countryPicker.delegate = self;
    self.countryPicker.dataSource = self;
    
    self.continent_name =[NSArray arrayWithObjects:@"Africa",@"Asia",@"Europe",@"North_America",@"South_America",@"Oceania", nil];
    
    NSArray *AfricaCoordinates=@[@-35,@40,@-17,@53];
    NSArray *AsiaCoordinates=@[@-15,@77,@34,@180];
    NSArray *EuropeCoordinates=@[@30,@80,@-10,@70];
    NSArray *NorthAmericaCoordinates=@[@5,@88,@-166,@-28];
    NSArray *SouthAmericaCoordinates=@[@-56,@12,@-80,@-35];
    NSArray *OceaniaCoordinates=@[@-47,@22,@120,@180];
    
    
    self.coordinates=[NSArray arrayWithObjects:AfricaCoordinates,
                                AsiaCoordinates,
                                EuropeCoordinates,
                                NorthAmericaCoordinates,
                                SouthAmericaCoordinates,
                                OceaniaCoordinates,
                                nil];
    
    // declare object of UITapGestureRecognizer
    UITapGestureRecognizer *tapFlag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapFlagHandler:)];
    
    // To set GestureRecognizer attributes
    tapFlag.numberOfTapsRequired = 1;
    self.countryFlag.userInteractionEnabled = YES;
    
    // To add GestureRecognizer to view
    [self.countryFlag addGestureRecognizer:tapFlag];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager: (CLLocationManager *)manager
     didUpdateLocations: (NSArray *)locations
{
    
    self.latitude=[[locations lastObject]coordinate].latitude;
    self.longitude=[[locations lastObject]coordinate].longitude;
    
    [self.nameOfCountry removeAllObjects];
    [self.nameOfFlag removeAllObjects];
    
    
    for(int i =0;i<self.coordinates.count;i++)
    {
        double la1 =[[[self.coordinates objectAtIndex:i] objectAtIndex:0]doubleValue];
        double lo1= [[[self.coordinates objectAtIndex:i] objectAtIndex:2]doubleValue];
        double la2= [[[self.coordinates objectAtIndex:i] objectAtIndex:1]doubleValue];
        double lo2= [[[self.coordinates objectAtIndex:i] objectAtIndex:3]doubleValue];
        
   
        if(self.latitude>=la1 && self.latitude<=la2)
        {
            if(self.longitude>=lo1 && self.longitude<=lo2)
            {
                [self.nameOfCountry addObjectsFromArray:[self.model countryName:self.continent_name[i]]];
                [self.nameOfFlag addObjectsFromArray:[self.model flagName:self.continent_name[i]]];
            }
        }
    }
  
        self.flagIndex = arc4random() % [self.nameOfFlag count];
    
        NSString *bundlePathName = [[NSBundle mainBundle] bundlePath];
        NSString *dataPathName = [bundlePathName stringByAppendingPathComponent:@"Flags"];
        NSString *PathName = [dataPathName stringByAppendingPathComponent:self.itemName];
        NSString *str = [PathName stringByAppendingPathComponent:[self.nameOfFlag objectAtIndex: self.flagIndex]];
        UIImage *image = [UIImage imageWithContentsOfFile:str];
        [self.countryFlag setImage: image];
        [self.countryPicker reloadAllComponents];

}

// To move frame up while writing in text field

-(void)animateTextField:(UITextField*)textField up:(BOOL)up
{
    const int movementDistance = -130;
    const float movementDuration = 0.3f;
    
    int movement = (up ? movementDistance : -movementDistance);
    
    [UIView beginAnimations: @"animateTextField" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

// to enable animation
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}

//to disable animation
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}

// Define action on TextField
- (IBAction)countryTextField:(id)sender
{
    NSString *elt2 = [NSString stringWithFormat:@ "%@ <Correct>",[self.nameOfCountry objectAtIndex:self.flagIndex]];
    NSString *elt3 = [NSString stringWithFormat:@ "%@ <Incorrect>",[self.countryText text]];
    
    if ([self.countryText hasText])
    {
        
        if ([self.countryText.text isEqualToString:[self.nameOfCountry objectAtIndex:self.flagIndex]])
        {
            [self.countryText setText:elt2];
        }
        
        else
        {
            [self.countryText setText:elt3];
        }
    }
}

// Define tap action on ImageView
- (void) tapFlagHandler: (UITapGestureRecognizer *) sender
{
    self.countryText.text = nil; // To empty textbox after tap for new image
    self.flagIndex = arc4random() % [self.nameOfFlag count];
    
    NSString *bundlePathName = [[NSBundle mainBundle] bundlePath];
    NSString *dataPathName = [bundlePathName stringByAppendingPathComponent:@"Flags"];
    NSString *PathName = [dataPathName stringByAppendingPathComponent:self.itemName];
    
    NSString *str = [PathName stringByAppendingPathComponent:[self.nameOfFlag objectAtIndex: self.flagIndex]];
    UIImage *image = [UIImage imageWithContentsOfFile:str];
    [self.countryFlag setImage: image];
}

// UIPickerViewDataSource

// The number of columns of data
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.nameOfCountry count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.nameOfCountry objectAtIndex:row];
}

// To select a specific row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *elt = [NSString stringWithFormat:@ "%@ <Correct>",[self.nameOfCountry objectAtIndex:row]];
    NSString *elt1 = [NSString stringWithFormat:@ "%@ <Incorrect>",[self.nameOfCountry objectAtIndex:row]];
    
    if (row == self.flagIndex)
    {
        [self.countryText setText:elt];
    }
    
    else
    {
        [self.countryText setText:elt1];
    }
}

// To enter text in TextField using keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.countryText )
    {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
