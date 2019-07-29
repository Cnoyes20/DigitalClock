//
//  SettingsViewController.m
//  DigitalClock
//
//  Created by Christopher Noyes on 7/11/19.
//  Copyright © 2019 Christopher Noyes. All rights reserved.
//

#import "SettingsViewController.h"
#import "MyCustomView.h"
#import "ViewController.h"
#import "Settings.h"

@interface SettingsViewController ()
{
    NSArray *timeZones;
    NSDate *currentTime;
    NSTimer *updateTime;
    NSString *selectedcolor;
    NSString *switchonoff;
    NSString *selectedtimezone;
    NSInteger currenttimezoneRow;
    NSString *selectedColor;
    NSString *selected12;
    
    NSArray<UIColor*> *swipeColors;
    NSInteger selectedSwipeColorIndex;
    
    Settings *settings;
 }

@property (weak, nonatomic) IBOutlet UIView *colorSelectView;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *colorButtons;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    swipeColors = @[UIColor.blueColor, UIColor.redColor, UIColor.greenColor, UIColor.orangeColor ,UIColor.blackColor];
   
    timeZones = @[@"America/New_York", @"Europe/London", @"Asia/Bangkok", @"Europe/Moscow", @"Pacific/Honolulu", @"America/Los_Angeles"];
    
    self.TimeZonePickerView.dataSource = self;
    self.TimeZonePickerView.delegate = self;
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"NSUDS-SAVE-DATA"];
    settings = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    switchonoff = settings.hrs12or24;
    selectedColor = settings.selectedColor;
    selected12 = settings.selected12or24;
    
    
    //selectedSwipeColor = settings.swipeColor;
    for(int colorIndex=0 ; colorIndex < swipeColors.count; colorIndex++) {
        UIColor *color = swipeColors[colorIndex];
        if([color isEqual: settings.swipeColor]) {
            selectedSwipeColorIndex = colorIndex;
        }
    }
    
    self.view.backgroundColor = swipeColors[selectedSwipeColorIndex];
    
    
    
    
// puts the selector on each colored button
    
    [self.TimeZonePickerView selectRow:settings.selectedTimeZoneRow inComponent:0 animated:true];
    
  
    
    for( UIButton *colorButton in self.colorButtons) {
        if([colorButton.backgroundColor isEqual: settings.color]) {
             self.colorSelectView.center = colorButton.center;
        }
    }
    
    if ([switchonoff isEqual:@"on"]) {
        [self.Switch24hr setOn:YES];
    }
    else {
        [self.Switch24hr setOn:NO];
    }
    
    //Swipe to change background color
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    
    // Setting the swipe direction.
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    // Adding the swipe gesture to view controller
    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];

    
}

//Swipe Gesture
- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Left Swipe");
        if(selectedSwipeColorIndex>0){
            selectedSwipeColorIndex--;
        }
    }
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Right Swipe");
        if(selectedSwipeColorIndex<swipeColors.count-1){
            selectedSwipeColorIndex++;
        }
    }
    self.view.backgroundColor = swipeColors[selectedSwipeColorIndex];
    settings.swipeColor = super.view.backgroundColor;
}



// Clock color buttons
- (IBAction)lightGreenButton:(UIButton *)sender {
    selectedcolor = @"light green";
    self.colorSelectView.center = sender.center;
}

- (IBAction)redButton:(UIButton *)sender {
    selectedcolor = @"red";
    self.colorSelectView.center = sender.center;
}

- (IBAction)blueButton:(UIButton *)sender {
     selectedcolor = @"blue";
    self.colorSelectView.center = sender.center;
}

- (IBAction)darkGreenButton:(UIButton *)sender {
    selectedcolor = @"dark green";
    self.colorSelectView.center = sender.center;
}

- (IBAction)colorButtonTapped:(UIButton *)sender {
    settings.color = sender.backgroundColor;
    self.colorSelectView.center = sender.center;
}

//24 Hour Switch

- (IBAction)SwitchPressed:(id)sender {
    if (self.Switch24hr.on){
        NSLog(@"Switch on");
        switchonoff = @"on";
        settings.hrs12or24 = @"on";
        settings.selected12or24 = @"HHmmss";
        // set hidden for am/pm
        
        
    } else {
        NSLog(@"Switch off");
        switchonoff = @"off";
        settings.hrs12or24 = @"off";
        settings.selected12or24 = @"hhmmss a";
    }
}

//Time zone Picker View

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return timeZones.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return timeZones[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%@",timeZones[row]);
    selectedtimezone = timeZones[row];
    settings.selectedTimeZone = timeZones[row];
    settings.selectedTimeZoneRow = row;
    currenttimezoneRow = row;
    
}

- (IBAction)doneButton:(id)sender
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:settings requiringSecureCoding:NO error:nil];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:@"NSUDS-SAVE-DATA"];
    [defaults synchronize];
    NSLog(@"Data Saved");
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    settings.selectedColor = selectedcolor;
}

@end
