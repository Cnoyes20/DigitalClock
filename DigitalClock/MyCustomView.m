//
//  MyCustomViewController.m
//  DigitalClock
//
//  Created by Christopher Noyes on 7/9/19.
//  Copyright © 2019 Christopher Noyes. All rights reserved.
//

#import "MyCustomView.h"

@interface MyCustomView ()

@end

@implementation MyCustomView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;
}

- (void)prepare {
    [[NSBundle mainBundle] loadNibNamed:@"MyCustomView" owner:self options:nil];
    [self addSubview:self.EntireView];
    self.EntireView.frame = self.bounds;
    self.backgroundColor = [UIColor clearColor];
}

-(void) setColor:(UIColor *)color {
    
    self.TopMiddleBar.backgroundColor = color;
    self.TopRightBar.backgroundColor = color;
    self.TopLeftBar.backgroundColor = color;
    self.MiddleBar.backgroundColor = color;
    self.BottomLeftBar.backgroundColor = color;
    self.BottomRightBar.backgroundColor = color;
    self.BottomMiddleBar.backgroundColor = color;
}

-(void)showDigit:(int) digit {
    
    // reset alpha for all views
    self.TopMiddleBar.alpha = 1.0;
    self.TopRightBar.alpha = 1.0;
    self.TopLeftBar.alpha = 1.0;
    self.MiddleBar.alpha = 1.0;
    self.BottomLeftBar.alpha = 1.0;
    self.BottomRightBar.alpha = 1.0;
    self.BottomMiddleBar.alpha = 1.0;
    
    // Customize colors:
    
    // UIColor *myRed = [[UIColor alloc] initWithRed: 1.0 green: 0.0 blue: 0.0 alpha: 1.0];
    // self.TopMiddleBar.backgroundColor = myRed;
    
    if ([_selectedColor isEqual: @"red"]) {
        self.TopMiddleBar.backgroundColor = [UIColor redColor];
        self.TopRightBar.backgroundColor = [UIColor redColor];
        self.TopLeftBar.backgroundColor = [UIColor redColor];
        self.MiddleBar.backgroundColor = [UIColor redColor];
        self.BottomLeftBar.backgroundColor = [UIColor redColor];
        self.BottomRightBar.backgroundColor = [UIColor redColor];
        self.BottomMiddleBar.backgroundColor = [UIColor redColor];
    }
    
    if ([_selectedColor isEqual: @"blue"]) {
        self.TopMiddleBar.backgroundColor = [UIColor blueColor];
        self.TopRightBar.backgroundColor = [UIColor blueColor];
        self.TopLeftBar.backgroundColor = [UIColor blueColor];
        self.MiddleBar.backgroundColor = [UIColor blueColor];
        self.BottomLeftBar.backgroundColor = [UIColor blueColor];
        self.BottomRightBar.backgroundColor = [UIColor blueColor];
        self.BottomMiddleBar.backgroundColor = [UIColor blueColor];
    }
    
    if ([_selectedColor isEqual: @"light green"]) {
        self.TopMiddleBar.backgroundColor = [UIColor greenColor];
        self.TopRightBar.backgroundColor = [UIColor greenColor];
        self.TopLeftBar.backgroundColor = [UIColor greenColor];
        self.MiddleBar.backgroundColor = [UIColor greenColor];
        self.BottomLeftBar.backgroundColor = [UIColor greenColor];
        self.BottomRightBar.backgroundColor = [UIColor greenColor];
        self.BottomMiddleBar.backgroundColor = [UIColor greenColor];
    }
    
    if ([_selectedColor isEqual: @"dark green"]) {
        self.TopMiddleBar.backgroundColor = [UIColor greenColor];
        self.TopRightBar.backgroundColor = [UIColor greenColor];
        self.TopLeftBar.backgroundColor = [UIColor greenColor];
        self.MiddleBar.backgroundColor = [UIColor greenColor];
        self.BottomLeftBar.backgroundColor = [UIColor greenColor];
        self.BottomRightBar.backgroundColor = [UIColor greenColor];
        self.BottomMiddleBar.backgroundColor = [UIColor greenColor];
    }
    
    
    if(digit==0){
        self.MiddleBar.alpha = 0.1;
    }
    
    if(digit==1){
        self.TopMiddleBar.alpha = 0.1;
        self.TopLeftBar.alpha = 0.1;
        self.MiddleBar.alpha = 0.1;
        self.BottomLeftBar.alpha = 0.1;
        self.BottomMiddleBar.alpha = 0.1;
    }
    
    if(digit==2){
        self.TopLeftBar.alpha = 0.1;
        self.BottomRightBar.alpha = 0.1;
    }
    
    if(digit==3){
        self.TopLeftBar.alpha = 0.1;
        self.BottomLeftBar.alpha = 0.1;
    }
    
    if(digit==4){
        self.TopMiddleBar.alpha = 0.1;
        self.BottomMiddleBar.alpha = 0.1;
        self.BottomLeftBar.alpha = 0.1;
    }
    
    if(digit==5){
        self.TopRightBar.alpha = 0.1;
        self.BottomLeftBar.alpha = 0.1;
    }
    
    if(digit==6){
        self.TopRightBar.alpha = 0.1;
    }
    
    if(digit==7){
        self.MiddleBar.alpha = 0.1;
        self.TopLeftBar.alpha = 0.1;
        self.BottomLeftBar.alpha = 0.1;
        self.BottomMiddleBar.alpha = 0.1;
    }
    
    if(digit==8){
     
    }
    
    if(digit==9){
        self.BottomLeftBar.alpha = 0.1;
    }
 
    
}


@end
