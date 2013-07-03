//
//  LFigure.m
//  TestTetris
//
//  Created by  Sonny Black on 10.04.13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "LFigure.h"

@implementation LFigure

-(id)init{
    self = [super init];
    if (self){
        FieldUnit *top = [[FieldUnit alloc] init];
        top.fieldColor = LFigureColor;
        top.state = 2;
        top.x = 6;
        top.y = 20;
        
        FieldUnit *middle = [[FieldUnit alloc] init];
        middle.fieldColor = LFigureColor;
        middle.state = 2;
        middle.x = 5;
        middle.y = 20;
        
        FieldUnit *bottomRight = [[FieldUnit alloc] init];
        bottomRight.fieldColor = LFigureColor;
        bottomRight.state = 2;
        bottomRight.x = 4;
        bottomRight.y = 20;
        
        FieldUnit *bottomLeft = [[FieldUnit alloc] init];
        bottomLeft.fieldColor = LFigureColor;
        bottomLeft.state = 2;
        bottomLeft.x = 4;
        bottomLeft.y = 19;
        
        self.blocks = @[top, middle, bottomRight, bottomLeft];
        self.orientation = Left;
        
    }
    return self;
}

- (BOOL) rotateFigureOnField:(NSArray *)field{
    if (self.orientation == Vertical){
        
        if ([self checkRotationForVerticalOrientationOnField:field]){
            [self rotateFigureFromVerticalPosition:field];
            return YES;
        }else{
            return NO;
        }
    }else if (self.orientation == Left){
        if ([self checkRotationForLeftOrientationOnField:field]){
			[self rotatefigureFromLeftPosition:field];
            return YES;
        }else{
			return NO;
        }
    }else if (self.orientation == UpsideDown){
        if ([self checkRotationForUpsideDownOrientationOnField:field]){
			[self rotateFigureFromUpsideDownPosition:field];
            return YES;
        }else{
			return NO;
        }
		
    }else if (self.orientation == Right){
        if ([self checkRotationForRightOrientationOnField:field]){
			[self rotateFigureFromRightPosition:field];
            return YES;
        }else{
			return NO;
        }
    }
	
	return NO;
}

#pragma mark - Checking for rotations

-(BOOL) checkRotationForVerticalOrientationOnField:(NSArray *)field{
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
            
        }else if (i == 2){
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
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x - 2;
            int yCord = block.y;
            
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

-(BOOL) checkRotationForLeftOrientationOnField:(NSArray *)field{
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
            
        }else if (i == 2){
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
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x + 2;
            int yCord = block.y;
            
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

-(BOOL) checkRotationForUpsideDownOrientationOnField:(NSArray *)field{
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
            
        }else if (i == 2){
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
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x + 2;
            int yCord = block.y;
            
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

-(BOOL) checkRotationForRightOrientationOnField:(NSArray *)field{
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
            
        }else if (i == 2){
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
            
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            int xCord = block.x;
            int yCord = block.y - 2;
            
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
            
        }else if (i == 2){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y++;
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x -= 2;
        }
    }
    self.orientation = Left;
}

-(void) rotatefigureFromLeftPosition:(NSArray *)field{
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y--;
        }else if (i == 1){
            
        }else if (i == 2){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y++;
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.y += 2;
        }
    }
    
    self.orientation = UpsideDown;
}

-(void) rotateFigureFromUpsideDownPosition:(NSArray *)field{
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y++;
        }else if (i == 1){
            
        }else if (i == 2){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y--;
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x += 2;
        }
    }
    
    self.orientation = Right;
}

-(void) rotateFigureFromRightPosition:(NSArray *)field{
    for (int i = 0; i < [self.blocks count]; i++){
        if (i == 0){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x++;
            block.y++;
        }else if (i == 1){
            
        }else if (i == 2){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.x--;
            block.y--;
        }else if (i == 3){
            FieldUnit *block = [self.blocks objectAtIndex:i];
            [self clearFieldUnit:block onField:field];
            
            block.y -= 2;
        }
    }
    
    self.orientation = Vertical;
}

@end
