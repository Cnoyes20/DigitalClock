//
//  Settings.m
//  DigitalClock
//
//  Created by Christopher Noyes on 7/12/19.
//  Copyright © 2019 Christopher Noyes. All rights reserved.
//

#import "Settings.h"

@implementation Settings



- (void)encodeWithCoder:(nonnull NSCoder *)aCoder
{
    NSLog(@"Encoder Called");
    [aCoder encodeObject:[self selectedColor] forKey:@"Color"];
    [aCoder encodeObject:[self hrs12or24] forKey:@"12or24"];
    [aCoder encodeObject:[self selectedTimeZone] forKey:@"Time Zone"];
    [aCoder encodeInteger:_selectedTimeZoneRow forKey:@"Time Zone Row"];
    [aCoder encodeObject:[self selected12or24] forKey:@"12"];
    
    [aCoder encodeObject:[self color] forKey:@"color"];
    
    [aCoder encodeObject:[self swipeColor] forKey:@"swipe color"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder
{
    NSLog(@"Decoder Called");
    self = [super init];
    if(self)
    {
        //decode properties, other class vars
        [self setSelectedColor:[aDecoder decodeObjectForKey:@"Color"]];
        [self setHrs12or24:[aDecoder decodeObjectForKey:@"12or24"]];
        [self setSelectedTimeZone:[aDecoder decodeObjectForKey:@"Time Zone"]];
        [self setSelectedTimeZoneRow:[aDecoder decodeIntegerForKey:@"Time Zone Row"]];
        [self setSelected12or24:[aDecoder decodeObjectForKey:@"12"]];
        
        [self setColor:[aDecoder decodeObjectForKey:@"color"]];
        
        [self setSwipeColor:[aDecoder decodeObjectForKey:@"swipe color"]];
    }
    return self;
}

@end
