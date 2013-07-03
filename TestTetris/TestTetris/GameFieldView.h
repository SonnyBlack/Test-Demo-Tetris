//
//  GameFieldView.h
//  TestTetris
//
//  Created by  Sonny Black on 08.04.13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameField.h"

@interface GameFieldView : UIView <GameFieldDelegate>


@property (nonatomic, strong) NSMutableArray	*tiles;

@end
