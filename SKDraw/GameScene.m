//
//  GameScene.m
//  sddasfsad
//
//  Created by Adam Wulf on 11/25/19.
//  Copyright © 2019 Milestone Made. All rights reserved.
//

#import "GameScene.h"
#import <SceneKit/SceneKit.h>

@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    // Get label node from scene and store it for use later
    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    
    _label.alpha = 0.0;
    [_label runAction:[SKAction fadeInWithDuration:2.0]];
    
    CGFloat w = (self.size.width + self.size.height) * 0.05;
    
    // Create shape node to use during mouse interaction
    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
    _spinnyNode.lineWidth = 2.5;
    
    [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
    [_spinnyNode runAction:[SKAction sequence:@[
                                                [SKAction waitForDuration:0.5],
                                                [SKAction fadeOutWithDuration:0.5],
                                                [SKAction removeFromParent],
                                                ]]];
    
    
    
    UIBezierPath *path;
    SKShapeNode *node;
    
    
    // clear screen
    
    node = [SKShapeNode shapeNodeWithPath:[[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 400, 400)] CGPath]];
    node.fillColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    node.lineWidth = 0;
    node.blendMode = SCNBlendModeScreen;
    node.fillShader = [SKShader shaderWithSource:@""];
    [self addChild:node];

    
    
    // draw corners
    
    node = [SKShapeNode shapeNodeWithPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(0, 0, 0, 0), -10, -10)] CGPath]];
    node.fillColor = [UIColor blueColor];
    node.lineWidth = 0;
    [self addChild:node];

    node = [SKShapeNode shapeNodeWithPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(0, 400, 0, 0), -10, -10)] CGPath]];
    node.fillColor = [UIColor blueColor];
    node.lineWidth = 0;
    [self addChild:node];

    node = [SKShapeNode shapeNodeWithPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(400, 0, 0, 0), -10, -10)] CGPath]];
    node.fillColor = [UIColor blueColor];
    node.lineWidth = 0;
    [self addChild:node];

    node = [SKShapeNode shapeNodeWithPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(400, 400, 0, 0), -10, -10)] CGPath]];
    node.fillColor = [UIColor blueColor];
    node.lineWidth = 0;
    [self addChild:node];
    
    
    // draw line
    
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addCurveToPoint:CGPointMake(175, 175) controlPoint1:CGPointMake(200, 0) controlPoint2:CGPointMake(100, 20)];
    
    node = [SKShapeNode shapeNodeWithPath:[path CGPath]];
    node.lineWidth = 10;
    node.strokeColor = [UIColor blueColor];
    [self addChild:node];

    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(40, 40)];
    [path addCurveToPoint:CGPointMake(175, 175) controlPoint1:CGPointMake(200, 0) controlPoint2:CGPointMake(100, 20)];

    
    node = [SKShapeNode shapeNodeWithPath:[path CGPath]];
    node.lineWidth = 10;
//    node.strokeColor = [UIColor redColor];
    node.strokeColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    node.blendMode = SCNBlendModeScreen;
    node.strokeShader = [SKShader shaderWithFileNamed:@"eraser.fsh"];
    [self addChild:node];
    
}


- (void)touchDownAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor greenColor];
    [self addChild:n];
}

- (void)touchMovedToPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor blueColor];
    [self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor redColor];
    [self addChild:n];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Run 'Pulse' action from 'Actions.sks'
    [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
    
    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
