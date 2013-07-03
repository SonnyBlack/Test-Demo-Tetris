//
//  FieldUnit.m
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "FieldUnit.h"

@implementation FieldUnit

@synthesize x = _x;
@synthesize y = _y;
@synthesize state = _state;
@synthesize fieldColor = _fieldColor;

-(BOOL) isOutCoordinateX:(int)x y:(int)y{
	BOOL success = NO;
	
	if (y < 1 || y > 20)
		return YES;
	
	if (x < 1 || x > 10)
		return YES;
	
	return success;
}

-(BOOL) isOutOfArrayX:(int)x y:(int)y{
	BOOL success = NO;
	
	if (y < 0 || y > 20)
		return YES;
	
	if (x < 0 || x > 10)
		return YES;
	
	return success;
}

@end
