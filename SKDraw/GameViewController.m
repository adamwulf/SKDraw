//
//  GameViewController.m
//  sddasfsad
//
//  Created by Adam Wulf on 11/25/19.
//  Copyright © 2019 Milestone Made. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController{
    IBOutlet SKView *_skView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the SKScene from 'GameScene.sks'
//    GameScene *scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    GameScene *scene = [GameScene node];
    [scene setSize:CGSizeMake(400, 400)];
    
    // Set the scale mode to scale to fit the window
    scene.scaleMode = SKSceneScaleModeFill;
    
    _skView = (SKView *)[[self.view subviews] firstObject];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    _skView.opaque = NO;
    _skView.backgroundColor = [UIColor clearColor];
    _skView.allowsTransparency = YES;
    _skView.showsFPS = YES;
    _skView.showsNodeCount = YES;
    
    // Present the scene
    [_skView presentScene:scene];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
