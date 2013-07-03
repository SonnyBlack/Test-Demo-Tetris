//
//  Figure.m
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "OFigure.h"

@implementation OFigure


-(id)init{
    self = [super init];
    if (self){
        FieldUnit *topLeft = [[FieldUnit alloc] init];
        topLeft.fieldColor = OFigureColor;
        topLeft.state = 2;
        topLeft.x = 5;
        topLeft.y = 20;
        
        FieldUnit *topRight = [[FieldUnit alloc] init];
        topRight.fieldColor = OFigureColor;
        topRight.state = 2;
        topRight.x = 6;
        topRight.y = 20;
        
        FieldUnit *bottomLeft = [[FieldUnit alloc] init];
        bottomLeft.fieldColor = OFigureColor;
        bottomLeft.state = 2;
        bottomLeft.x = 5;
        bottomLeft.y = 19;
        
        FieldUnit *bottomRight = [[FieldUnit alloc] init];
        bottomRight.fieldColor = OFigureColor;
        bottomRight.state = 2;
        bottomRight.x = 6;
        bottomRight.y = 19;
        
        self.blocks = @[topLeft, topRight, bottomLeft, bottomRight];
        
    }
    return self;
}



@end
