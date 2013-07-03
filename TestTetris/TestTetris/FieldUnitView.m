//
//  FieldUnitView.m
//  TestTetris
//
//  Created by  Sonny Black on 11.04.13.
//  Copyright (c) 2013 Sonny Black. All rights reserved.
//

#import "FieldUnitView.h"




#define CENTRAL_BLOCK_OFFSET        4.0

@implementation FieldUnitView

@synthesize color = _color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		
		_color = FieldColor;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    // Drawing code
    if (_color == FieldColor){
        CGFloat leftColorList[] = {
            126.0/255.0, 126.0/255.0, 126.0/255.0, 0.3, //red, green, blue, alpha
            123.0/255.0, 123.0/255.0, 123.0/255.0, 0.3
        };
        CGFloat topColorList[] = {
            158.0/255.0, 158.0/255.0, 158.0/255.0, 0.3, //red, green, blue, alpha
            151.0/255.0, 151.0/255.0, 151.0/255.0, 0.3
        };
        CGFloat rightColorList[] = {
            59.0/255.0,  59.0/255.0, 59.0/255.0, 0.3, //red, green, blue, alpha
            64.0/255.0,  64.0/255.0, 64.0/255.0, 0.3
        };
        CGFloat bottomColorList[] = {
            39.0/255.0, 39.0/255.0, 39.0/255.0, 0.3, //red, green, blue, alpha
            45.0/255.0, 45.0/255.0, 45.0/255.0, 0.3
        };
        CGFloat centralColorList[] = {
            90.0/255.0, 90.0/255.0, 90.0/255.0, 0.3, //red, green, blue, alpha
            95.0/255.0, 95.0/255.0, 95.0/255.0, 0.3
        };
        
        [self drawCurrentFigureWithContext:context
                             leftColorList:leftColorList
                              topColorList:topColorList
                            rightColorList:rightColorList
                           bottomColorList:bottomColorList
                          centralColorList:centralColorList
                                    inRect:rect];
     
    }else if (_color == OFigureColor){
        CGFloat leftColorList[] = {
            255.0/255.0, 255.0/255.0, 143.0/255.0, 1.0, //red, green, blue, alpha
            253.0/255.0, 246.0/255.0,   0.0/255.0, 1.0
        };
        CGFloat topColorList[] = {
            255.0/255.0, 255.0/255.0, 245.0/255.0, 1.0, //red, green, blue, alpha
            250.0/255.0, 250.0/255.0, 240.0/255.0, 1.0
        };
        CGFloat rightColorList[] = {
            129.0/255.0,  127.0/255.0, 0.0/255.0, 1.0, //red, green, blue, alpha
            185.0/255.0,  178.0/255.0, 0.0/255.0, 1.0
        };
        CGFloat bottomColorList[] = {
            185.0/255.0, 178.0/255.0,  0.0/255.0, 1.0, //red, green, blue, alpha
            143.0/255.0, 141.0/255.0,  0.0/255.0, 1.0
        };
        CGFloat centralColorList[] = {
            228.0/255.0, 219.0/255.0, 10.0/255.0, 1.0, //red, green, blue, alpha
            226.0/255.0, 220.0/255.0,  0.0/255.0, 1.0
        };
        
        [self drawCurrentFigureWithContext:context
                             leftColorList:leftColorList
                              topColorList:topColorList
                            rightColorList:rightColorList
                           bottomColorList:bottomColorList
                          centralColorList:centralColorList
                                    inRect:rect];
        
    }else if (_color == JFigureColor){
        CGFloat leftColorList[] = {
            136.0/255.0, 180.0/255.0, 255.0/255.0, 1.0, //red, green, blue, alpha
              0.0/255.0,  99.0/255.0, 255.0/255.0, 1.0
        };
        CGFloat topColorList[] = {
            241.0/255.0, 247.0/255.0, 255.0/255.0, 1.0, //red, green, blue, alpha
            186.0/255.0, 207.0/255.0, 253.0/255.0, 1.0
        };
        CGFloat rightColorList[] = {
            0.0/255.0,  47.0/255.0, 134.0/255.0, 1.0, //red, green, blue, alpha
            0.0/255.0,  64.0/255.0, 187.0/255.0, 1.0
        };
        CGFloat bottomColorList[] = {
            0.0/255.0, 52.0/255.0, 151.0/255.0, 1.0, //red, green, blue, alpha
            2.0/255.0, 53.0/255.0, 154.0/255.0, 1.0
        };
        CGFloat centralColorList[] = {
            0.0/255.0, 77.0/255.0, 227.0/255.0, 1.0, //red, green, blue, alpha
            0.0/255.0, 80.0/255.0, 241.0/255.0, 1.0
        };
        
        [self drawCurrentFigureWithContext:context
                             leftColorList:leftColorList
                              topColorList:topColorList
                            rightColorList:rightColorList
                           bottomColorList:bottomColorList
                          centralColorList:centralColorList
                                    inRect:rect];
  
    }else if (_color == IFigureColor){
            CGFloat leftColorList[] = {
                146.0/255.0, 255.0/255.0, 255.0/255.0, 1.0, //red, green, blue, alpha
                  0.0/255.0, 253.0/255.0, 253.0/255.0, 1.0
            };
            CGFloat topColorList[] = {
                241.0/255.0, 255.0/255.0, 255.0/255.0, 1.0, //red, green, blue, alpha
                187.0/255.0, 253.0/255.0, 253.0/255.0, 1.0
            };
            CGFloat rightColorList[] = {
                0.0/255.0,  136.0/255.0, 136.0/255.0, 1.0, //red, green, blue, alpha
                0.0/255.0,  182.0/255.0, 182.0/255.0, 1.0
            };
            CGFloat bottomColorList[] = {
                0.0/255.0, 150.0/255.0, 150.0/255.0, 1.0, //red, green, blue, alpha
                1.0/255.0, 154.0/255.0, 150.4/255.0, 1.0
            };
            CGFloat centralColorList[] = {
                3.0/255.0, 227.0/255.0, 227.0/255.0, 1.0, //red, green, blue, alpha
                0.0/255.0, 225.0/255.0, 225.0/255.0, 1.0
            };
            
            [self drawCurrentFigureWithContext:context
                                 leftColorList:leftColorList
                                  topColorList:topColorList
                                rightColorList:rightColorList
                               bottomColorList:bottomColorList
                              centralColorList:centralColorList
                                        inRect:rect];
        
	}else if (_color == LFigureColor){
        CGFloat leftColorList[] = {
            245.0/255.0, 181.0/255.0, 130.0/255.0, 1.0, //red, green, blue, alpha
            233.0/255.0, 122.0/255.0,  52.0/255.0, 1.0
        };
        CGFloat topColorList[] = {
            253.0/255.0, 244.0/255.0, 234.0/255.0, 1.0, //red, green, blue, alpha
            249.0/255.0, 216.0/255.0, 191.0/255.0, 1.0
        };
        CGFloat rightColorList[] = {
            125.0/255.0, 60.0/255.0, 22.0/255.0, 1.0, //red, green, blue, alpha
            168.0/255.0, 83.0/255.0, 33.0/255.0, 1.0
        };
        CGFloat bottomColorList[] = {
            129.0/255.0, 61.0/255.0, 23.0/255.0, 1.0, //red, green, blue, alpha
            134.0/255.0, 67.0/255.0, 24.0/255.0, 1.0
        };
        CGFloat centralColorList[] = {
            226.0/255.0, 139.0/255.0, 82.0/255.0, 1.0, //red, green, blue, alpha
            175.0/255.0,  86.0/255.0, 35.0/255.0, 1.0
        };
        
        [self drawCurrentFigureWithContext:context
                             leftColorList:leftColorList
                              topColorList:topColorList
                            rightColorList:rightColorList
                           bottomColorList:bottomColorList
                          centralColorList:centralColorList
                                    inRect:rect];
        
	}else if (_color == SFigureColor){
        CGFloat leftColorList[] = {
            175.0/255.0, 246.0/255.0, 165.0/255.0, 1.0, //red, green, blue, alpha
            227.0/255.0, 242.0/255.0,  50.0/255.0, 1.0
        };
        CGFloat topColorList[] = {
            242.0/255.0, 253.0/255.0, 241.0/255.0, 1.0, //red, green, blue, alpha
            203.0/255.0, 246.0/255.0, 201.0/255.0, 1.0
        };
        CGFloat rightColorList[] = {
             62.0/255.0, 123.0/255.0, 22.0/255.0, 1.0, //red, green, blue, alpha
             91.0/255.0, 176.0/255.0, 30.0/255.0, 1.0
        };
        CGFloat bottomColorList[] = {
             72.0/255.0, 142.0/255.0, 25.0/255.0, 1.0, //red, green, blue, alpha
             70.0/255.0, 138.0/255.0, 25.0/255.0, 1.0
        };
        CGFloat centralColorList[] = {
            113.0/255.0, 216.0/255.0, 36.0/255.0, 1.0, //red, green, blue, alpha
            114.0/255.0, 217.0/255.0, 38.0/255.0, 1.0
        };
        
        [self drawCurrentFigureWithContext:context
                             leftColorList:leftColorList
                              topColorList:topColorList
                            rightColorList:rightColorList
                           bottomColorList:bottomColorList
                          centralColorList:centralColorList
                                    inRect:rect];
        
	}else if (_color == TFigureColor){
        CGFloat leftColorList[] = {
            208.0/255.0, 166.0/255.0, 254.0/255.0, 1.0, //red, green, blue, alpha
            156.0/255.0,  87.0/255.0, 251.0/255.0, 1.0
        };
        CGFloat topColorList[] = {
            249.0/255.0, 240.0/255.0, 235.0/255.0, 1.0, //red, green, blue, alpha
            229.0/255.0, 203.0/255.0, 254.0/255.0, 1.0
        };
        CGFloat rightColorList[] = {
            76.0/255.0,   38.0/255.0, 123.0/255.0, 1.0, //red, green, blue, alpha
            110.0/255.0,  58.0/255.0, 184.0/255.0, 1.0
        };
        CGFloat bottomColorList[] = {
            85.0/255.0, 44.0/255.0, 145.0/255.0, 1.0, //red, green, blue, alpha
            85.0/255.0, 44.0/255.0, 142.0/255.0, 1.0
        };
        CGFloat centralColorList[] = {
            133.0/255.0, 75.0/255.0, 226.0/255.0, 1.0, //red, green, blue, alpha
            138.0/255.0, 77.0/255.0, 228.0/255.0, 1.0
        };
        
        [self drawCurrentFigureWithContext:context
                             leftColorList:leftColorList
                              topColorList:topColorList
                            rightColorList:rightColorList
                           bottomColorList:bottomColorList
                          centralColorList:centralColorList
                                    inRect:rect];
        
	}else if (_color == ZFigureColor){
        CGFloat leftColorList[] = {
            240.0/255.0, 157.0/255.0, 174.0/255.0, 1.0, //red, green, blue, alpha
            233.0/255.0,  64.0/255.0,  73.0/255.0, 1.0
        };
        CGFloat topColorList[] = {
            252.0/255.0, 242.0/255.0, 248.0/255.0, 1.0, //red, green, blue, alpha
            244.0/255.0, 194.0/255.0, 204.0/255.0, 1.0
        };
        CGFloat rightColorList[] = {
            118.0/255.0,  28.0/255.0, 34.0/255.0, 1.0, //red, green, blue, alpha
            170.0/255.0,  44.0/255.0, 49.0/255.0, 1.0
        };
        CGFloat bottomColorList[] = {
            133.0/255.0, 33.0/255.0, 38.0/255.0, 1.0, //red, green, blue, alpha
            136.0/255.0, 33.0/255.0, 39.0/255.0, 1.0
        };
        CGFloat centralColorList[] = {
            208.0/255.0, 56.0/255.0, 59.0/255.0, 1.0, //red, green, blue, alpha
            208.0/255.0, 56.0/255.0, 61.0/255.0, 1.0
        };
        
        [self drawCurrentFigureWithContext:context
                             leftColorList:leftColorList
                              topColorList:topColorList
                            rightColorList:rightColorList
                           bottomColorList:bottomColorList
                          centralColorList:centralColorList
                                    inRect:rect];
	}
}

#pragma mark - Private drawing methods

- (void)drawCurrentFigureWithContext:(CGContextRef)context
                       leftColorList:(CGFloat *)leftColorList
                        topColorList:(CGFloat *)topColorList
                      rightColorList:(CGFloat *)rightColorList
                     bottomColorList:(CGFloat *)bottomColorList
                    centralColorList:(CGFloat *)centralColorList
                              inRect:(CGRect)rect
{
    CGContextSaveGState(context);
    
    [self drawFigureSectorInContext:context
                            topLeft:CGPointMake(rect.origin.x, rect.origin.y)
                           topRight:CGPointMake(rect.origin.x, rect.size.height)
                        bottomRight:CGPointMake(CENTRAL_BLOCK_OFFSET, rect.size.height - CENTRAL_BLOCK_OFFSET)
                         bottomLeft:CGPointMake(CENTRAL_BLOCK_OFFSET, rect.origin.y + CENTRAL_BLOCK_OFFSET)
                          colorList:leftColorList
                 gradientStartPoint:CGPointMake(0.0, 0.0)
                   gradientEndPoint:CGPointMake(0.0, rect.size.height)];
    
    [self drawFigureSectorInContext:context
                            topLeft:CGPointMake(rect.origin.x, rect.origin.y)
                           topRight:CGPointMake(rect.size.width, rect.origin.y)
                        bottomRight:CGPointMake(rect.size.width - CENTRAL_BLOCK_OFFSET, CENTRAL_BLOCK_OFFSET)
                         bottomLeft:CGPointMake(CENTRAL_BLOCK_OFFSET, rect.origin.y + CENTRAL_BLOCK_OFFSET)
                          colorList:topColorList
                 gradientStartPoint:CGPointMake(0.0, 0.0)
                   gradientEndPoint:CGPointMake(rect.size.width, 0.0)];
    
    [self drawFigureSectorInContext:context
                            topLeft:CGPointMake(rect.size.width - CENTRAL_BLOCK_OFFSET, CENTRAL_BLOCK_OFFSET)
                           topRight:CGPointMake(rect.size.width, rect.origin.y)
                        bottomRight:CGPointMake(rect.size.width, rect.size.height)
                         bottomLeft:CGPointMake(rect.size.width - CENTRAL_BLOCK_OFFSET, rect.size.height - CENTRAL_BLOCK_OFFSET)
                          colorList:rightColorList
                 gradientStartPoint:CGPointMake(0.0, 0.0)
                   gradientEndPoint:CGPointMake(rect.size.height, 0.0)];
    
    [self drawFigureSectorInContext:context
                            topLeft:CGPointMake(CENTRAL_BLOCK_OFFSET, rect.size.height - CENTRAL_BLOCK_OFFSET)
                           topRight:CGPointMake(rect.size.width - CENTRAL_BLOCK_OFFSET, rect.size.height - CENTRAL_BLOCK_OFFSET)
                        bottomRight:CGPointMake(rect.size.width, rect.size.height)
                         bottomLeft:CGPointMake(rect.origin.x, rect.size.height)
                          colorList:bottomColorList
                 gradientStartPoint:CGPointMake(0.0, 0.0)
                   gradientEndPoint:CGPointMake(rect.size.width, 0.0)];
    
    [self drawCentralGradientBlockInContext:context
                                       rect:CGRectMake(CENTRAL_BLOCK_OFFSET, CENTRAL_BLOCK_OFFSET, rect.size.width - 2 * CENTRAL_BLOCK_OFFSET, rect.size.height - 2 * CENTRAL_BLOCK_OFFSET)
                                  colorList:centralColorList
                         gradientStartPoint:CGPointMake(CENTRAL_BLOCK_OFFSET, CENTRAL_BLOCK_OFFSET)
                           gradientEndPoint:CGPointMake(rect.size.width - CENTRAL_BLOCK_OFFSET, rect.size.height - CENTRAL_BLOCK_OFFSET)];
    
    CGContextRestoreGState(context);
}


-(void) drawFigureSectorInContext:(CGContextRef)context
                          topLeft:(CGPoint)topLeft
                         topRight:(CGPoint)topRight
                      bottomRight:(CGPoint)bottomRight
                       bottomLeft:(CGPoint)bottomLeft
                        colorList:(CGFloat *)colorList
               gradientStartPoint:(CGPoint)startPoint
                 gradientEndPoint:(CGPoint)endPoint {
    
    CGContextSaveGState(context);
    
    CGContextMoveToPoint(context, topLeft.x, topLeft.y);
    CGContextAddLineToPoint(context, topRight.x, topRight.y);
    CGContextAddLineToPoint(context, bottomRight.x, bottomRight.y);
    CGContextAddLineToPoint(context, bottomLeft.x, bottomLeft.y);
    CGContextClosePath(context);
    
    CGGradientRef myGradient;
    CGColorSpaceRef myColorSpace;
    size_t locationCount = 2;
    CGFloat locationList[] = {0.0, 1.0};
    myColorSpace = CGColorSpaceCreateDeviceRGB();
    myGradient = CGGradientCreateWithColorComponents(myColorSpace, colorList, locationList, locationCount);
    
    //Paint a linear gradient
    CGContextClip(context);
    CGContextDrawLinearGradient(context, myGradient, startPoint, endPoint, 0);
    CGGradientRelease(myGradient);
    CGColorSpaceRelease(myColorSpace);
    
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextRestoreGState(context);
}

-(void) drawCentralGradientBlockInContext:(CGContextRef)context
                                     rect:(CGRect)rect
                                colorList:(CGFloat *)colorList
                       gradientStartPoint:(CGPoint)startPoint
                         gradientEndPoint:(CGPoint)endPoint {
   
    CGContextSaveGState(context);
    
    CGContextAddRect(context, rect);
    
    CGGradientRef myGradient;
    CGColorSpaceRef myColorSpace;
    size_t locationCount = 2;
    CGFloat locationList[] = {0.0, 1.0};
    myColorSpace = CGColorSpaceCreateDeviceRGB();
    myGradient = CGGradientCreateWithColorComponents(myColorSpace, colorList, locationList, locationCount);
    
    //Paint a linear gradient
    CGContextClip(context);
    CGContextDrawLinearGradient(context, myGradient, startPoint, endPoint, 0);
    CGGradientRelease(myGradient);
    CGColorSpaceRelease(myColorSpace);
    
    CGContextDrawPath(context, kCGPathFill);
    
    
    CGContextRestoreGState(context);
}


@end
