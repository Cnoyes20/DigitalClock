//
//  MyCustomViewController.h
//  DigitalClock
//
//  Created by Christopher Noyes on 7/9/19.
//  Copyright © 2019 Christopher Noyes. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCustomView : UIView

@property (strong, nonatomic) IBOutlet UIView *EntireView;

@property (weak, nonatomic) IBOutlet UIView *TopMiddleBar;
@property (weak, nonatomic) IBOutlet UIView *TopLeftBar;
@property (weak, nonatomic) IBOutlet UIView *TopRightBar;
@property (weak, nonatomic) IBOutlet UIView *MiddleBar;
@property (weak, nonatomic) IBOutlet UIView *BottomLeftBar;
@property (weak, nonatomic) IBOutlet UIView *BottomRightBar;
@property (weak, nonatomic) IBOutlet UIView *BottomMiddleBar;

@property (nonatomic) UIColor *color;

-(void)showDigit:(int) digit;



@property (nonatomic, strong) NSString *selectedColor;

@end

NS_ASSUME_NONNULL_END
