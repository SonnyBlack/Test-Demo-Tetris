//
//  SBViewController.m
//  TestTetris
//
//  Created by Sonny Black on 4/7/13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "SBViewController.h"
#import "GameField.h"
#import "GameFieldView.h"

@interface SBViewController ()

@end

@implementation SBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
	field = [[GameField alloc] init];
	fieldView = [[GameFieldView alloc] initWithFrame:CGRectMake(80.0, 15.0, 160.0, 320.0)];
	[self.view addSubview:fieldView];
	field.delegate = fieldView;
	[field setupGameField];
	
	UIButton *rotareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	rotareBtn.frame = CGRectMake(250.0, 380.0, 60.0, 44.0);
	[rotareBtn setTitle:@"Rot" forState:UIControlStateNormal];
	[rotareBtn addTarget:field action:@selector(rotateFigure) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:rotareBtn];
	
	UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	rightBtn.frame = CGRectMake(110.0, 360.0, 60.0, 44.0);
	[rightBtn setTitle:@"Right" forState:UIControlStateNormal];
	[rightBtn addTarget:field action:@selector(moveRightFigure) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:rightBtn];
	
	UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	leftBtn.frame = CGRectMake(15.0, 360.0, 60.0, 44.0);
	[leftBtn setTitle:@"Left" forState:UIControlStateNormal];
	[leftBtn addTarget:field action:@selector(moveLeftFigure) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:leftBtn];
	
    UIButton *downBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	downBtn.frame = CGRectMake(60.0, 420.0, 60.0, 44.0);
	[downBtn setTitle:@"Down" forState:UIControlStateNormal];
	[downBtn addTarget:field action:@selector(disableFastMoving) forControlEvents:UIControlEventTouchUpInside];
	[downBtn addTarget:field action:@selector(fastMoveDownOfFigure) forControlEvents:UIControlEventTouchDown];
	[self.view addSubview:downBtn];
  
}

-(void) viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	
	[field startGame];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
