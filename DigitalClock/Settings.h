//
//  Settings.h
//  DigitalClock
//
//  Created by Christopher Noyes on 7/12/19.
//  Copyright © 2019 Christopher Noyes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Settings : NSObject
<NSCoding>

@property (nonatomic, strong) NSString *selectedColor;
@property (nonatomic, strong) NSString *hrs12or24;
@property (nonatomic, strong) NSString *selectedTimeZone;
@property (nonatomic) NSInteger selectedTimeZoneRow;
@property (nonatomic, strong) NSString *selected12or24;

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIColor *swipeColor;



@end
NS_ASSUME_NONNULL_END

