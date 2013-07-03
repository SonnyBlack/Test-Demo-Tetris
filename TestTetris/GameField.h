//
//  GameField.h
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Figure.h"
#import "FieldUnit.h"


@protocol GameFieldDelegate;

@interface GameField : FieldUnit
{
	CADisplayLink	*_gameLoopTimer;
}

@property (nonatomic, strong)   NSArray					*gameField;
@property (nonatomic, strong)   Figure					*currentFigure;
@property (nonatomic, weak)		id <GameFieldDelegate>	delegate;

-(void) setupGameField;
-(void) startGame;
//-(NSArray *) createGameField;
//-(void) printGameField;
//-(void) printGameCoordinates;
-(void) rotateFigure;
-(void) moveRightFigure;
-(void) moveLeftFigure;
-(void) moveDownFigure;

-(void) fastMoveDownOfFigure;
-(void) disableFastMoving;

@end


@protocol GameFieldDelegate <NSObject>

@optional
-(void)gameFieldNeedRedrawForField:(NSArray *)field;

@end