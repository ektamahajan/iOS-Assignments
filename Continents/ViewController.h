//
//  ViewController.h
//  Continents
//
//  Ekta Mahajan [SUID- 29317-4940]
//  Course CIS-651
//  Homework:3
//
//  Copyright © 2015 Ekta Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


// Declare Protocols
<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView  *countryFlag;    // Declare object of UIImageView
@property (weak, nonatomic) IBOutlet UIPickerView *countryPicker;  // Declare object of UIPickerView
@property (weak, nonatomic) IBOutlet UITextField  *countryText;    // Delcare object of UITextField
@property (strong,nonatomic) NSString *itemName;
@property NSInteger itemNumber;
@property NSMutableArray *nameOfCountry, *nameOfFlag;

@end
