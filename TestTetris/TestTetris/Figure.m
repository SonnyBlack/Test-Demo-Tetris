//
//  Figure.m
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "Figure.h"


@implementation Figure

@synthesize blocks = _blocks;

-(BOOL) rotateFigureOnField:(NSArray *)field{
    return NO;
}

-(void) clearFieldUnit:(FieldUnit *)unit onField:(NSArray *)field{
    NSArray *yRow = [field objectAtIndex:(20 - unit.y)];
    FieldUnit *fieldCell = [yRow objectAtIndex:(unit.x - 1)];
    fieldCell.state = 0;
    fieldCell.fieldColor = FieldColor;
}


@end
