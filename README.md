# SFButtonNode
SFButtonNode allows you to easily create buttons with customs shapes, colors, images and labels with SpriteKit. It also allows for much simpler workflow in chaining methods to your buttons, without the need to use `- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;`

## Creating a button with textures

```
   	SFButtonNode *textureButton = [SFButtonNode buttonWithIdleImageName:@"some_image_1.png" selectedImageName:@"some_image_2.png"];
	[self addChild:textureButton];
```

## Creating a circle button

```
    SFButtonNode *circleColorButton = [SFButtonNode buttonWithCircleOfRadius:55.0
                                                               idleFillColor:[SKColor redColor]
                                                           selectedFillColor:[SKColor blueColor]
                                                               labelWithText:@"Button!"];
    [self addChild:circleColorButton];
```

## Creating a custom shape button

```
    CGSize size = CGSizeMake(150, 60)
    
    SKShapeNode *shape1 = [SKShapeNode shapeNodeWithEllipseOfSize:size];
    [shape setFillColor:color redColor];

    SKShapeNode *shape2 = [SKShapeNode shapeNodeWithEllipseOfSize:size];
    [shape setFillColor:[SKColor blueColor]];

    SFButtonNode *shapeButton = [SFButtonNode buttonWithIdleShape:shape1
                                                    selectedShape:shape2
                                                    labelWithText:@"Button!"];
    [self addChild:shapeButton];
```

## Adding a selector to a button

```
- (void)didMoveToView:(SKView)view {
    SFButtonNode *button = [SFButtonNode buttonWithIdleColor:[SKColor redColor] selectedColor:[SKColor blueColor] size:CGSizeMake(150, 50)];
    [self addChild:button];
    
    [button setTouchDownInsideTarget:self selector:@selector(touchDownInside)];
    [button setTouchUpInsideTarget:self selector:@selector(touchUpInside)];
    [button setTouchUpOutsideTarget:self selector:@selector(touchUpOutside)];
}

- (void)touchDownInside {
  NSLog(@"Touch down inside");
}

- (void)touchUpInside {
  NSLog(@"Touch up inside");
}

- (void)touchUpOutside {
  NSLog(@"Touch up outside");
}

```

