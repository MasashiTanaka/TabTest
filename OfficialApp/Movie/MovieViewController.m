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

@synthesize movnam,resnam,restyp,_player;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.title=movnam;
    UIView *contentView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	self.view = contentView;

    [self play];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [super viewWillAppear:animated];
}


- (void) viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
}

- (void)play {
    //NSString *path = [[NSBundle mainBundle] pathForResource:resnam ofType:@"mp4"];
    NSString *path = [[NSBundle mainBundle] pathForResource:resnam ofType:restyp];
    NSURL *url = [NSURL fileURLWithPath:path];
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    _player = player;
    
    // MoviePlayerの設定
    player.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    player.moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(finishPreload:)
                                                 name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(finishPlayback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:nil];
    
    // viewに追加
    player.view.frame=CGRectMake(0, 0, 320, 480);
    player.moviePlayer.backgroundView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:player.view];

    if(restyp != @"mp4") {
        NSString *imageName;
        UIImage *image;
        resnam = [resnam stringByAppendingString:@"_aw"];
        imageName = [[NSBundle mainBundle] pathForResource:resnam ofType:@"jpg"];
        image=[UIImage imageWithContentsOfFile:imageName];
        if(image==nil){
            imageName = [[NSBundle mainBundle] pathForResource:@"noimgs" ofType:@"jpg"];
            image=[UIImage imageWithContentsOfFile:imageName];
        }
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image=image;
        imageView.frame=CGRectMake(40,0,240,480);
        imageView_ = imageView;
        [self.view addSubview:imageView];
        [imageView release];
    }

    //[_player play];
}

- (void)finishPreload:(NSNotification *)aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                                  object:player];
    [player play];
}

- (void)finishPlayback:(NSNotification *)aNotification {
    /*
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:player];
    [player stop];
    [player release];
    [self.navigationController popViewControllerAnimated:YES];
     */

    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:player];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
                                         duration:(NSTimeInterval)duration {
    if (interfaceOrientation == UIInterfaceOrientationPortrait ||
        interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        imageView_.center = CGPointMake(160, 240);
        imageView_.bounds = CGRectMake(0, 0, 240, 480);
    }
    else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
             interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        imageView_.center = CGPointMake(240, 160);
        imageView_.bounds = CGRectMake(0, 0, 480, 180);
    }
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
