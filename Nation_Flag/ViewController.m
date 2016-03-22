//
//  ViewController.m
//  Nation_Flag
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:2
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import "ViewController.h"
#import "Nation_Model.h"


@interface ViewController ()

@property (strong,nonatomic) Nation_Model *model; // declare object of model
@property (assign) NSInteger flagIndex;           // declare variable

@end


@implementation ViewController

   // Define model
- (Nation_Model *) model
{
    if (!_model)
        _model = [[Nation_Model alloc] init];
    return _model;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   // Do any additional setup after loading the view, typically from a nib.
    
   // To set background color
    self.view.backgroundColor = [UIColor lightGrayColor];

   // To connect data of TextField & PickerView
    self.countryText.delegate =self;
    
    self.countryPicker.delegate = self;
    self.countryPicker.dataSource = self;
    
   // declare object of UITapGestureRecognizer
    UITapGestureRecognizer *tapFlag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapFlagHandler:)];
    
   // To set GestureRecognizer attributes
    tapFlag.numberOfTapsRequired = 1;
    self.countryFlag.userInteractionEnabled = YES;
    
   // To add GestureRecognizer to view
    [self.countryFlag addGestureRecognizer:tapFlag];
    
}

   // Define action on TextField
- (IBAction)countryTextField:(id)sender
{
    NSString *elt2 = [NSString stringWithFormat:@ "%@ <Correct>",[self.model countryName:self.flagIndex]];
    NSString *elt3 = [NSString stringWithFormat:@ "%@ <Incorrect>",[self.countryText text]];

    if ([self.countryText hasText])
    {
        
    if ([self.countryText.text isEqualToString:[self.model countryName:self.flagIndex]])
    {
        [self.countryText setText:elt2];
    }
    
    else
    {
        [self.countryText setText:elt3];
    }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    // Define tap action on ImageView
- (void) tapFlagHandler: (UITapGestureRecognizer *) sender
{
    self.countryText.text = nil; // To empty textbox after tap for new image
    self.flagIndex = arc4random() % [self.model maxIndex];
    [self.countryFlag setImage:[UIImage imageNamed: [self.model flagName:self.flagIndex]]];
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
    return [self.model maxIndex];
}

    // The data to return for the row and component (column) that's being passed in
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.model countryName:row];
}

    // To select a specific row
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *elt = [NSString stringWithFormat:@ "%@ <Correct>",[self.model countryName:row]];
    NSString *elt1 = [NSString stringWithFormat:@ "%@ <Incorrect>",[self.model countryName:row]];
    
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
