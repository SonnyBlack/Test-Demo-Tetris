//
//  GameFieldView.m
//  TestTetris
//
//  Created by  Sonny Black on 08.04.13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "GameFieldView.h"
#import "FieldUnit.h"
#import "FieldUnitView.h"

@implementation GameFieldView

@synthesize tiles = _tiles;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
		_tiles = [[NSMutableArray alloc] init];
		
        
		for (int i = 0; i < 20; i ++){
			NSMutableArray *temp = [[NSMutableArray alloc] init];
			
			for (int k = 0; k < 10; k++){
                
                FieldUnitView *tile = [[FieldUnitView alloc] initWithFrame:CGRectMake(0 + k * 16.0, 0 + i * 16.0, 16.0, 16.0)];
                tile.color = FieldColor;
                [tile setNeedsDisplay];
                [temp addObject:tile];
				[self addSubview:tile];
			}
			[_tiles addObject:temp];
		}
		
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)gameFieldNeedRedrawForField:(NSArray *)field{
	for (int i = 0; i < 20; i ++){
        NSArray *tempData = [field objectAtIndex:i];
		NSArray *tempTiles = [_tiles objectAtIndex:i];
		
        for (int k = 0; k < 10; k++){
            FieldUnit *unit = [tempData objectAtIndex:k];
			FieldUnitView	*tile = [tempTiles objectAtIndex:k];
			
            if (unit.fieldColor == tile.color){
                continue;
            }else{
                tile.color = unit.fieldColor;
                [tile setNeedsDisplay];
            }
        }
    }
}



@end
