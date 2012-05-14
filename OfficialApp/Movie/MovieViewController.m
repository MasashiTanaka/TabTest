//
//  FirstViewController.m
//  TabTest
//
//  Created by 雅士 田中 on 12/05/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()
@end

@implementation MovieViewController

@synthesize movnam,resnam,_player;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=movnam;
	// Do any additional setup after loading the view, typically from a nib.
    [self play];
}

- (void)play {
    NSString *path = [[NSBundle mainBundle] pathForResource:resnam ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:url];
    _player = player;
    
    // MoviePlayerの設定
    //player.scalingMode = MPMovieScalingModeAspectFit;
    //player.controlStyle = MPMovieControlStyleDefault;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(finishPreload:)
                                                 name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                               object:player];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(finishPlayback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:player];
    
    // viewに追加
    [player.view setFrame:CGRectMake(0, 0, 320,300)];
    //[player.view setFrame:self.view.frame];
    [self.view addSubview:player.view];
    //[player play];
    [_player play];
    //[player release];
}

- (void)finishPreload:(NSNotification *)aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                                  object:player];
    [player play];
}

- (void)finishPlayback:(NSNotification *)aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:player];
    [player stop];
    [player release];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc {
    [_player release];
    
    [super dealloc];
}

@end
