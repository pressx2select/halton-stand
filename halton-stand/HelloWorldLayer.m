//
//  HelloWorldLayer.m
//  halton-stand
//
//  Created by Patrick Cleary on 9/25/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init]) ) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"It's alive!!!" fontName:@"Marker Felt" fontSize:64];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
        
        
        
        
        
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"halton.plist"];
        CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"halton.png"];
        [self addChild:spriteSheet];
        
        NSMutableArray *animFrames = [NSMutableArray array];
        for (int i = 1; i <= 2; i++) {
            NSString *file = [NSString stringWithFormat:@"halton%d.png", i];
            CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:file];
            [animFrames addObject:frame];
            
        }
        
        CCSprite *player = [CCSprite spriteWithSpriteFrameName:@"halton1.png"];		
        player.position = ccp(200, 150);
        player.scale =2.0;
        [player.texture setAliasTexParameters];
        [spriteSheet addChild:player];
        
        CCAnimation *anim = [CCAnimation animationWithSpriteFrames:animFrames delay:0.30f];
        CCRepeatForever *repeat = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:anim]];
        //        CCAction *moveAction = [CCMoveBy actionWithDuration:2.0f position:CGPointMake(500.0f,0.0f)];
        
        [player runAction:repeat];
        //        [player runAction:moveAction];
        
        
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
