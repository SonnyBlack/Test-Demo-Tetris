//
//  SBViewController.h
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameField.h"
#import "GameFieldView.h"

@interface SBViewController : UIViewController
{
	GameField		*field;
	GameFieldView	*fieldView;
}


@end
