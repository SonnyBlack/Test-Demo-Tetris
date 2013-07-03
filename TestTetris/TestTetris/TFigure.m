//
//  TFigure.m
//  TestTetris
//
//  Created by  Sonny Black on 10.04.13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "TFigure.h"

@implementation TFigure

-(id)init{
    self = [super init];
    if (self){
        FieldUnit *top = [[FieldUnit alloc] init];
        top.fieldColor = TFigureColor;
        top.state = 2;
        top.x = 5;
        top.y = 20;
        
        FieldUnit *bottomLeft = [[FieldUnit alloc] init];
        bottomLeft.fieldColor = TFigureColor;
        bottomLeft.state = 2;
        bottomLeft.x = 4;
        bottomLeft.y = 19;
        
        FieldUnit *bottomMiddle = [[FieldUnit alloc] init];
        bottomMiddle.fieldColor = TFigureColor;
        bottomMiddle.state = 2;
        bottomMiddle.x = 5;
        bottomMiddle.y = 19;
        
        FieldUnit *bottomRight = [[FieldUnit alloc] init];
        bottomRight.fieldColor = TFigureColor;
        bottomRight.state = 2;
        bottomRight.x = 6;
        bottomRight.y = 19;
        
        self.blocks = @[top, bottomLeft, bottomMiddle, bottomRight];
        self.orientation = Vertical;
        
    }
    return self;
}

- (BOOL) rotateFigureOnField:(NSArray *)field{
    if (self.orientation == Vertical){
        
        if ([self checkRotationFromVerticalOrientationOnField:field]){
            [self rotateFigureFromVerticalPosition:field];
            return YES;
        }else{
            return NO;
        }
    }else if (self.orientation == Right){
        if ([self checkRotationFromRightOrientationOnField:field]){
			[self rotateFigureFromRightPosition:field];
            return YES;
        }else{
			return NO;
        }
    }else if (self.orientation == UpsideDown){
        if ([self checkRotationFromUpsideDownOrientationOnField:field]){
			[self rotateFigureFromUpsideDownPosition:field];
            return YES;
        }else{
			return NO;
        }
	}else if (self.orientation == Left){
		if ([self checkRotationFromLeftOrientationOnField:field]){
			[self rotatefigureFromLeftPosition:field];
			return YES;
		}else{
			return NO;
		}
	}
	
	return NO;
}

#pragma mark - Checking for rotations

-(BOOL) checkRotationFromVerticalOrientationOnField:(NSArray *)field{
    BOOL success = YES;
    
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x + 1;
            int yCord = block.y - 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
			
        }else if (i == 1){
			FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x + 1;
            int yCord = block.y + 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
			
        }else if (i == 2){
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x - 1;
            int yCord = block.y - 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
        }
    }
    return success;
}

-(BOOL) checkRotationFromLeftOrientationOnField:(NSArray *)field{
	BOOL success = YES;
    
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x + 1;
            int yCord = block.y + 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
			
        }else if (i == 1){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x - 1;
            int yCord = block.y + 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
			
        }else if (i == 2){
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x + 1;
            int yCord = block.y - 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
        }
    }
    return success;
}

-(BOOL) checkRotationFromUpsideDownOrientationOnField:(NSArray *)field{
	BOOL success = YES;
    
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x - 1;
            int yCord = block.y + 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
			
        }else if (i == 1){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x - 1;
            int yCord = block.y - 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;

			
        }else if (i == 2){
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x + 1;
            int yCord = block.y + 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
        }
    }
    return success;
}

-(BOOL) checkRotationFromRightOrientationOnField:(NSArray *)field{
	BOOL success = YES;
    
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x - 1;
            int yCord = block.y - 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
			
        }else if (i == 1){
			FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x + 1;
            int yCord = block.y - 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
			
        }else if (i == 2){
                       
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x - 1;
            int yCord = block.y + 1;
            
			if ([self isOutCoordinateX:xCord y:yCord]){
				return NO;
			}
			if ([self isOutOfArrayX:(xCord - 1) y:(20 - yCord)]){
				return NO;
			}
			
            NSArray *yRow = [field objectAtIndex:(20 - yCord)];
            FieldUnit *fieldCell = [yRow objectAtIndex:(xCord - 1)];
            if (fieldCell.state == 2 || fieldCell.state == 0)
                success &= YES;
            else
                return NO;
            
        }
    }
    return success;
}

#pragma mark - Helper rotation methods

-(void) rotateFigureFromVerticalPosition:(NSArray *)field{
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y--;
        }else if (i == 1){
			FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y++;
        }else if (i == 2){
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y--;
        }
    }
    self.orientation = Right;
}

-(void) rotatefigureFromLeftPosition:(NSArray *)field{
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y++;
        }else if (i == 1){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y++;
        }else if (i == 2){
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y--;
        }
    }
    
    self.orientation = Vertical;
}

-(void) rotateFigureFromUpsideDownPosition:(NSArray *)field{
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y++;
        }else if (i == 1){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y--;
        }else if (i == 2){
           
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y++;

        }
    }
    
    self.orientation = Left;
}

-(void) rotateFigureFromRightPosition:(NSArray *)field{
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y--;
        }else if (i == 1){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y--;
        }else if (i == 2){
          
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y++;
        }
    }
    
    self.orientation = UpsideDown;
}

@end
