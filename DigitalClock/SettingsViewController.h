//
//  SettingsViewController.h
//  DigitalClock
//
//  Created by Christopher Noyes on 7/11/19.
//  Copyright © 2019 Christopher Noyes. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

//Pickerview
@property (weak, nonatomic) IBOutlet UIPickerView *TimeZonePickerView;

//Switch
@property (weak, nonatomic) IBOutlet UISwitch *Switch24hr;

//Color Buttons
@property (weak, nonatomic) IBOutlet UIButton *lightGreenButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *darkGreenButton;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;



@end

NS_ASSUME_NONNULL_END
