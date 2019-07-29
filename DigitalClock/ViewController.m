//
//  ViewController.m
//  DigitalClock
//
//  Created by Christopher Noyes on 7/9/19.
//  Copyright © 2019 Christopher Noyes. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomView.h"
#import "SettingsViewController.h"
#import "Settings.h"

@interface ViewController () {
      Settings *settings;
    
   
}

@property (weak, nonatomic) IBOutlet MyCustomView *digitHourOne;
@property (weak, nonatomic) IBOutlet MyCustomView *digitHourTwo;
@property (weak, nonatomic) IBOutlet MyCustomView *digitMinuteOne;
@property (weak, nonatomic) IBOutlet MyCustomView *digitMinuteTwo;
@property (weak, nonatomic) IBOutlet MyCustomView *digitSecondOne;
@property (weak, nonatomic) IBOutlet MyCustomView *digitSecondTwo;

@property IBOutlet UILabel *AMLabel;
@property IBOutlet UILabel *PMLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self loadSettings];
    
    
    [self updateTime];
    
    // Do any additional setup after loading the view.
    
    updateTime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self loadSettings];

    
    
}

-(void) loadSettings {
    
     
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"NSUDS-SAVE-DATA"];
    settings = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    if(settings==nil){ // First time load
        settings = [[Settings alloc] init];
        settings.selectedColor = @"light green";
        settings.selected12or24 = @"HHmmss a";
        settings.selectedTimeZone = @"America/New_York";
        settings.swipeColor = UIColor.blackColor;
        
        self.digitHourOne.selectedColor = settings.selectedColor;
        self.digitHourTwo.selectedColor = settings.selectedColor;
        self.digitMinuteOne.selectedColor = settings.selectedColor;
        self.digitMinuteTwo.selectedColor = settings.selectedColor;
        self.digitSecondOne.selectedColor = settings.selectedColor;
        self.digitSecondTwo.selectedColor = settings.selectedColor;
        
        
        NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:settings requiringSecureCoding:NO error:nil];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:encodedObject forKey:@"NSUDS-SAVE-DATA"];
        [defaults synchronize];
        NSLog(@"Data Saved");

        
    }
    
//color change for digits
    
    self.digitHourOne.color = settings.color;
    self.digitHourTwo.color = settings.color;
    self.digitMinuteOne.color = settings.color;
    self.digitMinuteTwo.color = settings.color;
    self.digitSecondOne.color = settings.color;
    self.digitSecondTwo.color = settings.color;
    
//background color change with swipe gesture
    self.view.backgroundColor = settings.swipeColor;

}

-(void) swipeColor:(UIColor *)swipeColor {
    
    self.view.backgroundColor = swipeColor;
}

- (void) updateTime {
    
 //   [updateTime invalidate];
 //   updateTime = nil;
    
    currentTime = [NSDate date];
    NSDateFormatter *timeformatter = [[NSDateFormatter alloc]init];
    [timeformatter setTimeZone: [NSTimeZone timeZoneWithName:settings.selectedTimeZone]];
    [timeformatter setDateFormat: settings.selected12or24];
    NSString *str = [timeformatter stringFromDate:currentTime];
    
  //  NSLog(@"%@",str);
    
    int hrOne = [str characterAtIndex:0]-48;
    int hrTwo = [str characterAtIndex:1]-48;
    int minOne = [str characterAtIndex:2]-48;
    int minTwo = [str characterAtIndex:3]-48;
    int secOne = [str characterAtIndex:4]-48;
    int secTwo = [str characterAtIndex:5]-48;
    
 
    
    [self.digitHourOne showDigit: hrOne];
    [self.digitHourTwo showDigit: hrTwo];
    [self.digitMinuteOne showDigit: minOne];
    [self.digitMinuteTwo showDigit: minTwo];
    [self.digitSecondOne showDigit: secOne];
    [self.digitSecondTwo showDigit: secTwo];
    
    [timeformatter setDateFormat:@"a"];
    NSString *str2 = [timeformatter stringFromDate:currentTime];
    
    if ([settings.selected12or24  isEqual: @"HHmmss"]) {
        [self.AMLabel setHidden:YES];
        [self.PMLabel setHidden:YES];
    }
    else if ([str2  isEqual: @"AM"]) {
         [self.AMLabel setHidden:NO];
         [self.PMLabel setHidden:YES];
    }
    else {
         [self.PMLabel setHidden:NO];
         [self.AMLabel setHidden:YES];
    }
    
    [timeformatter setDateFormat:@"EEEE, MMM d"];
    self.dateLabel.text = [timeformatter stringFromDate:currentTime];
    
}





- (void) didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
