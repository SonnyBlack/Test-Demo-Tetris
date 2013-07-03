//
//  GameField.m
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "GameField.h"
#import "FieldUnit.h"
#import "OFigure.h"
#import "JFigure.h"
#import "IFigure.h"
#import "LFigure.h"
#import "SFigure.h"
#import "TFigure.h"
#import "ZFigure.h"

#define DEFAULT_SPEED		60

@implementation GameField

@synthesize gameField = _gameField;
@synthesize currentFigure = _currentFigure;
@synthesize delegate = _delegate;

- (id)init{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void) setupGameField{
	_gameField = [self createGameField];
	

}

-(void) startGame{
	_gameLoopTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(gameFieldLoop)];
	[_gameLoopTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
	_gameLoopTimer.frameInterval = DEFAULT_SPEED;
}

#pragma mark - Game Field methods

-(NSArray *) createGameField{
    NSMutableArray  *result = [[NSMutableArray alloc] init];
    
    int xCord = 1;
    int yCord = 20;
    
    for (int i = 0; i < 20; i ++){
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (int k = 0; k < 10; k++){
            FieldUnit *unit = [[FieldUnit alloc] init];
            unit.state = 0;
            unit.x = xCord;
            unit.y = yCord;
            unit.fieldColor = FieldColor;
            [temp addObject:unit];
            xCord++;
        }
        
        [result addObject:temp];
        yCord--;
        xCord = 1;
    }
    // test
//    NSArray *arr = [result objectAtIndex:19];
//    FieldUnit *border = [arr objectAtIndex:4];
//    border.state = 1;
    
    
    return result;
}

#pragma mark - Helper methods

-(void) printGameField{
    for (int i = 0; i < 20; i ++){
        NSArray *temp = [_gameField objectAtIndex:i];
        
        for (int k = 0; k < 10; k++){
            FieldUnit *unit = [temp objectAtIndex:k];
            printf("%d", unit.state);
        }
        printf("\n");
    }
    printf("\n\n");
}

-(void) printGameCoordinates{
    for (int i = 0; i < 20; i ++){
        NSArray *temp = [_gameField objectAtIndex:i];
        
        for (int k = 0; k < 10; k++){
            FieldUnit *unit = [temp objectAtIndex:k];
            printf(" {%d, %d} ", unit.x, unit.y);
        }
        printf("\n");
    }
    printf("\n\n");
}

#pragma mark - Figure move methods

-(void) setFigureToPosition{
    for (FieldUnit *block in _currentFigure.blocks){
        NSArray *yRow = [_gameField objectAtIndex:(20 - block.y)];
        FieldUnit *fieldCell = [yRow objectAtIndex:(block.x - 1)];
        fieldCell.state = block.state;
        fieldCell.fieldColor = block.fieldColor;
    }
}


-(void) rotateFigure{
	if ([_currentFigure rotateFigureOnField:_gameField]){
        [self setFigureToPosition];
        if (_delegate && [_delegate respondsToSelector:@selector(gameFieldNeedRedrawForField:)]){
            [_delegate gameFieldNeedRedrawForField:_gameField];
        }
    }
	
	
}

-(void) moveRightFigure{
	if ([self checkRight]){
        
        for (FieldUnit *block in _currentFigure.blocks){
            NSArray *yRow = [_gameField objectAtIndex:(20 - block.y)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(block.x - 1)];
            fieldCell.state = 0;
            fieldCell.fieldColor = FieldColor;
            block.x++;
        }
        [self setFigureToPosition];
		
		if (_delegate && [_delegate respondsToSelector:@selector(gameFieldNeedRedrawForField:)]){
			[_delegate gameFieldNeedRedrawForField:_gameField];
		}
		
    }else{
		return;
    }
}

-(void) moveDownFigure{
    if ([self checkBottom]){
        
        for (FieldUnit *block in _currentFigure.blocks){
            NSArray *yRow = [_gameField objectAtIndex:(20 - block.y)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(block.x - 1)];
            fieldCell.state = 0;
            fieldCell.fieldColor = FieldColor;
            block.y--;
        }
        [self setFigureToPosition];
		//        [self printGameField];
		
		if (_delegate && [_delegate respondsToSelector:@selector(gameFieldNeedRedrawForField:)]){
			[_delegate gameFieldNeedRedrawForField:_gameField];
		}
		
    }else{
        [self remainingFigure];
        [self checkForCompleteLines];
        
        [self generateRandomFigure];
    }
}


-(void) moveLeftFigure{
	if ([self checkLeft]){
        
        for (FieldUnit *block in _currentFigure.blocks){
            NSArray *yRow = [_gameField objectAtIndex:(20 - block.y)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(block.x - 1)];
            fieldCell.state = 0;
            fieldCell.fieldColor = FieldColor;
            block.x -= 1;
        }
        [self setFigureToPosition];
		
		if (_delegate && [_delegate respondsToSelector:@selector(gameFieldNeedRedrawForField:)]){
			[_delegate gameFieldNeedRedrawForField:_gameField];
		}
		
    }else{
		return;
    }
}

-(void) fastMoveDownOfFigure{
	_gameLoopTimer.frameInterval = 5;
}

-(void) disableFastMoving{
	_gameLoopTimer.frameInterval = DEFAULT_SPEED;
}


#pragma mark - Checking methods

-(BOOL) checkBottom{
    BOOL success = YES;
    
    for (FieldUnit *block in _currentFigure.blocks){
        int yCord = 20 - (block.y - 1);
		int xCord = block.x - 1;
		
        if ([self isOutCoordinateX:block.x y:block.y - 1])
            return NO;
		if ([self isOutOfArrayX:xCord y:yCord]){
			return NO;
		}
		
        NSArray *yRow = [_gameField objectAtIndex:yCord];
        FieldUnit *fieldCell = [yRow objectAtIndex:xCord];
        if (fieldCell.state == 2 || fieldCell.state == 0)
            success &= YES;
        else
            return NO;
    }
    return success;
}

-(BOOL) checkRight{
    BOOL success = YES;
    
    for (FieldUnit *block in _currentFigure.blocks){
        int yCord = 20 - block.y;
		int xCord = block.x + 1;
		
        if ([self isOutCoordinateX:xCord y:block.y])
            return NO;
		if ([self isOutOfArrayX:(xCord - 1)  y:yCord]){
			return NO;
		}
		
		NSArray *yRow = [_gameField objectAtIndex:yCord];
        FieldUnit *fieldCell = [yRow objectAtIndex:block.x];
        if (fieldCell.state == 2 || fieldCell.state == 0)
            success &= YES;
        else
            return NO;
    }
    return success;
}

-(BOOL) checkLeft{
    BOOL success = YES;
    
    for (FieldUnit *block in _currentFigure.blocks){
        int yCord = 20 - block.y;
		int xCord = block.x - 1;
		
        if ([self isOutCoordinateX:xCord y:block.y])
            return NO;
		if ([self isOutOfArrayX:(xCord - 1) y:yCord]){
			return NO;
		}
		
		NSArray *yRow = [_gameField objectAtIndex:yCord];
        FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
        if (fieldCell.state == 2 || fieldCell.state == 0)
            success &= YES;
        else if (fieldCell.state == 1)
            return NO;
		
    }
    return success;
}

-(BOOL) checkForEndGame{
	BOOL success = NO;
	NSArray *topRow = [_gameField objectAtIndex:0];
	
	for (FieldUnit *unit in topRow){
		if (unit.state == 0)
			success &= NO;
		else if (unit.state == 1)
			return YES;
	}
	return success;
}

-(BOOL) checkForCompleteLines{
    BOOL success = NO;
    
    int loc = 0;
    int len = 0;
    NSMutableArray *fieldCopy = [_gameField mutableCopy];
    
    for (int i = 0; i < 20; i ++){
        NSArray *temp = [_gameField objectAtIndex:i];
        
        BOOL rowCheck = YES;
        for (int k = 0; k < 10; k++){
            FieldUnit *unit = [temp objectAtIndex:k];
            if (unit.state == 1){
                rowCheck &= YES;
            }else if (unit.state != 1){
                rowCheck = NO;
            }
        }
        
        if (rowCheck){
            loc = i;
            len++;
            success = YES;
        }
        
    }
    if (success){
        [fieldCopy removeObjectsInRange:NSMakeRange(loc - len + 1, len)];
        _gameField = [self returnNewFieldWithData:fieldCopy];
    }
    
    return success;
}


-(NSArray *)returnNewFieldWithData:(NSMutableArray *)field{
    
    NSMutableArray  *result = [[NSMutableArray alloc] init];
    
    int xCord = 1;
    int yCord = 20;
    
    int countDifference = 20 - [field count];
    int oldFieldIndex = 0;
    
    for (int i = 0; i < 20; i ++){
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        if (i < countDifference){
            
            for (int k = 0; k < 10; k++){
                FieldUnit *unit = [[FieldUnit alloc] init];
                unit.state = 0;
                unit.fieldColor = FieldColor;
                unit.x = xCord;
                unit.y = yCord;
                [temp addObject:unit];
                xCord++;
            }
            
            [result addObject:temp];
            yCord--;
            xCord = 1;
        }else{
            NSArray *oldRow = [field objectAtIndex:oldFieldIndex];
            
            for (int k = 0; k < 10; k++){
                FieldUnit *oldUnit = [oldRow objectAtIndex:k];
                FieldUnit *unit = [[FieldUnit alloc] init];
                
                unit.state = oldUnit.state;
                unit.fieldColor = oldUnit.fieldColor;
                unit.x = xCord;
                unit.y = yCord;
                [temp addObject:unit];
                xCord++;
            }
            
            [result addObject:temp];
            yCord--;
            xCord = 1;
            oldFieldIndex++;
        }
    }
    
    return result;
}

-(void)remainingFigure{
    for (FieldUnit *block in _currentFigure.blocks){
        NSArray *yRow = [_gameField objectAtIndex:(20 - block.y)];
        FieldUnit *fieldCell = [yRow objectAtIndex:(block.x - 1)];
        fieldCell.state = 1;
    }
	
//	[self printGameField];
	
}

#pragma mark - Game logic

-(void)gameFieldLoop{
	// for first time
	if (!_currentFigure){
        [self generateRandomFigure];
    
	}else{
		[self moveDownFigure];
		
		if ([self checkForEndGame]){
			[_gameLoopTimer invalidate];
			NSLog (@"GAME OVER");
		}
	}
}

-(void) generateRandomFigure{
    int random = arc4random() % 7;
    switch (random) {
        case 0:
            _currentFigure = nil;
            _currentFigure = [[JFigure alloc] init];
            break;
            
        case 1:
            _currentFigure = nil;
            _currentFigure = [[OFigure alloc] init];
            break;
		
		case 2:
            _currentFigure = nil;
            _currentFigure = [[IFigure alloc] init];
            break;
			
		case 3:
            _currentFigure = nil;
            _currentFigure = [[LFigure alloc] init];
            break;
			
		case 4:
            _currentFigure = nil;
            _currentFigure = [[SFigure alloc] init];
            break;
		
		case 5:
            _currentFigure = nil;
            _currentFigure = [[TFigure alloc] init];
            break;
		
		case 6:
            _currentFigure = nil;
            _currentFigure = [[ZFigure alloc] init];
            break;
			
        default:
            break;
    }
	
	[self setFigureToPosition];
	if (_delegate && [_delegate respondsToSelector:@selector(gameFieldNeedRedrawForField:)]){
		[_delegate gameFieldNeedRedrawForField:_gameField];
	}
}

@end






