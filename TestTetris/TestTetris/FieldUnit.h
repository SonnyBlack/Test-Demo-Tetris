//
//  FieldUnit.h
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FieldUnit : NSObject

@property (nonatomic) int           x;
@property (nonatomic) int           y;
@property (nonatomic) int           state;
@property (nonatomic) FigureColor   fieldColor;

-(BOOL) isOutCoordinateX:(int)x y:(int)y;
-(BOOL) isOutOfArrayX:(int)x y:(int)y;

@end
