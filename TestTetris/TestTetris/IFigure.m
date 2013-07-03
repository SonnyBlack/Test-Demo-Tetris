//
//  IFigure.m
//  TestTetris
//
//  Created by  Sonny Black on 09.04.13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "IFigure.h"

@implementation IFigure

-(id)init{
    self = [super init];
    if (self){
        FieldUnit *top = [[FieldUnit alloc] init];
        top.fieldColor = IFigureColor;
        top.state = 2;
        top.x = 4;
        top.y = 20;
        
        FieldUnit *middle = [[FieldUnit alloc] init];
        middle.fieldColor = IFigureColor;
        middle.state = 2;
        middle.x = 5;
        middle.y = 20;
        
        FieldUnit *bottomRight = [[FieldUnit alloc] init];
        bottomRight.fieldColor = IFigureColor;
        bottomRight.state = 2;
        bottomRight.x = 6;
        bottomRight.y = 20;
        
        FieldUnit *bottomLeft = [[FieldUnit alloc] init];
        bottomLeft.fieldColor = IFigureColor;
        bottomLeft.state = 2;
        bottomLeft.x = 7;
        bottomLeft.y = 20;
        
        self.blocks = @[top, middle, bottomRight, bottomLeft];
        self.orientation = Right;
        
    }
    return self;
}

- (BOOL) rotateFigureOnField:(NSArray *)field{
    if (self.orientation == Vertical){
        
        if ([self checkRotationForRightOrientationOnField:field]){
            [self rotateFigureFromVerticalPosition:field];
            return YES;
        }else{
            return NO;
		}
        
    }else if (self.orientation == Right){
        if ([self checkRotationForVerticalOrientationOnField:field]){
			[self rotateFigureFromRightPosition:field];
            return YES;
        }else{
			return NO;
        }
		
    }

	return NO;
}

-(BOOL) checkRotationForVerticalOrientationOnField:(NSArray *)field{
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
            int xCord = block.x - 2;
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

-(BOOL) checkRotationForRightOrientationOnField:(NSArray *)field{
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
            int yCord = block.y + 2;
            
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

-(void) rotateFigureFromVerticalPosition:(NSArray *)field{
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
            
			block.x += 2;
            block.y += 2;
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
            
            block.x -= 2;
			block.y -= 2;
        }
    }
    
    self.orientation = Vertical;
}


@end
