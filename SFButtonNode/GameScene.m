//
//  GameScene.m
//  SFButtonNode
//
//  Created by Skye on 3/27/15.
//  Copyright (c) 2015 Skye Freeman. All rights reserved.
//

#import "GameScene.h"
#import "SFButtonNode.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    CGSize buttonSize = CGSizeMake(150, 50);
    CGFloat padding = 30.0;
    CGFloat positionX = self.size.width/2;
    
    //Rectangle button with colors
    SFButtonNode *rectangleColorButton = [SFButtonNode buttonWithIdleColor:[SKColor redColor]
                                                             selectedColor:[SKColor blueColor]
                                                                      size:buttonSize
                                                             labelWithText:@"Button!"];
    [rectangleColorButton setPosition:CGPointMake(positionX, self.size.height - rectangleColorButton.size.height/2 - padding)];
    [rectangleColorButton setTouchDownInsideTarget:self selector:@selector(rectangleColorButtonTouchDown)];
    [self addChild:rectangleColorButton];
    
    //Circle button with different colors
    SFButtonNode *circleColorButton = [SFButtonNode buttonWithCircleOfRadius:55.0
                                                               idleFillColor:[SKColor redColor]
                                                           selectedFillColor:[SKColor blueColor]
                                                               labelWithText:@"Button!"];
    [circleColorButton setPosition:CGPointMake(positionX, rectangleColorButton.position.y - rectangleColorButton.size.height/2 - circleColorButton.size.height/2 - padding)];
    [circleColorButton setTouchDownInsideTarget:self selector:@selector(circleColorButtonTouchDown)];
    [self addChild:circleColorButton];
    
    //Circle button with different sizes
    SFButtonNode *circleSizesButton = [SFButtonNode buttonWithIdleCircleOfRadius:55.0
                                                          selectedCircleOfRadius:50.0
                                                                       fillColor:[SKColor redColor]
                                                                   labelWithText:@"Button!"];
    [circleSizesButton setPosition:CGPointMake(positionX, circleColorButton.position.y - circleColorButton.size.height/2 - circleSizesButton.size.height/2 - padding)];
    [circleSizesButton setTouchDownInsideTarget:self selector:@selector(circleSizesButtonTouchDown)];
    [self addChild:circleSizesButton];
    
    //Button with different custom shapes
    SKShapeNode *largeEllipse = [self ellipseWithSize:CGSizeMake(150, 60) fillColor:[SKColor redColor]];
    SKShapeNode *smallEllipse = [self ellipseWithSize:CGSizeMake(140, 55) fillColor:[SKColor redColor]];
    
    SFButtonNode *shapeButton = [SFButtonNode buttonWithIdleShape:largeEllipse
                                                    selectedShape:smallEllipse
                                                    labelWithText:@"Button!"];
    [shapeButton setPosition:CGPointMake(positionX, circleSizesButton.position.y - circleSizesButton.size.height/2 - shapeButton.size.height/2 - padding)];
    [shapeButton setTouchDownInsideTarget:self selector:@selector(shapesButtonTouchDown)];
    [self addChild:shapeButton];
    
    //Button with textures
    SFButtonNode *textureButton = [SFButtonNode buttonWithIdleImageName:@"button_up_blank"
                                                      selectedImageName:@"button_down_blank"];
    [textureButton setPosition:CGPointMake(positionX, shapeButton.position.y - shapeButton.size.height/2 - textureButton.size.height/2 - padding)];
    [textureButton setTouchDownInsideTarget:self selector:@selector(textureButtonTouchDown)];
    [self addChild:textureButton];
}

- (SKShapeNode*)ellipseWithSize:(CGSize)size fillColor:(SKColor*)color {
    SKShapeNode *shape = [SKShapeNode shapeNodeWithEllipseOfSize:size];
    [shape setFillColor:color];
    return shape;
}

#pragma mark - Button Selectors
- (void)rectangleColorButtonTouchDown {
    NSLog(@"Touched rectangle button with different colors!");
}

- (void)circleColorButtonTouchDown {
    NSLog(@"Touched circle button with different colors!");
}

- (void)circleSizesButtonTouchDown {
    NSLog(@"Touched circle button with different sizes!");
}

- (void)shapesButtonTouchDown {
    NSLog(@"Touched button with different shapes!");
}

- (void)textureButtonTouchDown {
    NSLog(@"Touched button with textures!");
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
@end
