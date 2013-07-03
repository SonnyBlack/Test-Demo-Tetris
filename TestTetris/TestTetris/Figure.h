//
//  Figure.h
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FieldUnit.h"


typedef enum {
    Vertical = 0,
    Right = 1,
    Left = 2,
    UpsideDown = 3
}FigureOrientation;

@interface Figure : FieldUnit

@property (nonatomic, strong) NSArray           *blocks;
@property (nonatomic, assign) FigureOrientation orientation;

-(BOOL) rotateFigureOnField:(NSArray *)field;
-(void) clearFieldUnit:(FieldUnit *)unit onField:(NSArray *)field;

@end
