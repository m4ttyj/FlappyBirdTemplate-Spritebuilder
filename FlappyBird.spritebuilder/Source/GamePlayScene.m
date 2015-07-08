#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

// put new methods here
-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    //This will be called everytime the user touches the screen
    [character flap];
    
}

-(void)update:(CCTime)delta
{
    //delta is the time elapsed since the last time it was run.
    //This is usually 1/60, but can be bigger if the game slows down.
    
    //increment the time since the last obstacle was created
    timeSinceObstacle += delta;
    
    //Check to see if 2 seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        //create another obstacle
        [self addObstacle];
        
        //then reset timer
        timeSinceObstacle = 0.0f;
    }
}

@end
