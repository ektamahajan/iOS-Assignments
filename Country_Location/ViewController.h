//
//  ViewController.h
//  Country_Location
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:4
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController


// Declare Protocols
<CLLocationManagerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView  *countryFlag;    // Declare object of UIImageView
@property (weak, nonatomic) IBOutlet UIPickerView *countryPicker;  // Declare object of UIPickerView
@property (weak, nonatomic) IBOutlet UITextField  *countryText;    // Delcare object of UITextField
@property (strong,nonatomic) NSString *itemName;
@property NSInteger itemNumber;
@property NSMutableArray *nameOfCountry, *nameOfFlag;
@property (strong, nonatomic) NSArray *continent_name;

@end

