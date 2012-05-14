//
//  FirstViewController.h
//  TabTest
//
//  Created by 雅士 田中 on 12/05/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController : UIViewController{
    NSString *movnam;
    NSString *resnam;
    MPMoviePlayerController *_player;
}

@property(nonatomic,assign)NSString *movnam;
@property(nonatomic,assign)NSString *resnam;
@property(nonatomic,assign)MPMoviePlayerController *_player;

- (void)play;

@end
