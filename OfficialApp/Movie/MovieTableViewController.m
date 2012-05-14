//
//  MovieTableViewController.m
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MovieTableViewController.h"
#import "MovieViewController.h"

@interface MovieTableViewController ()

@end

@implementation MovieTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = NSLocalizedString(@"Movie", @"Movie");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    _theList = [[NSArray alloc] initWithObjects: @"rega1",@"Mr.MARLOWE",@"mrmarlowe",@"mp4", @"rega1",@"VIP", @"vip",@"mp4", @"rega2",@"Dress [Live]", @"dress",@"mp4",@"rega2",@"endoor",@"endoor",@"mp3",@"ixy1",@"Canon IXY CM",@"ixy_cm",@"mp4",nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_theList count]/4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyle)UITableViewCellStyleDefault reuseIdentifier:nil];

    NSString *resnam=[_theList objectAtIndex:(indexPath.row)*4+2];

    if(resnam != nil) {
        NSString *imageName = [[NSBundle mainBundle] pathForResource:resnam ofType:@"jpg"];
        UIImage *image=[UIImage imageWithContentsOfFile:imageName];

        if(image==nil){
            imageName = [[NSBundle mainBundle] pathForResource:@"noimgs" ofType:@"jpg"];
            image=[UIImage imageWithContentsOfFile:imageName];
        }

        cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [cell.imageView setFrame:CGRectMake(10,10,50,50)];
        cell.imageView.image=image;
    }
    cell.textLabel.text=[_theList objectAtIndex:(indexPath.row)*4+1];
	return cell;
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view data source


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //MovieViewController *movie = [self.storyboard instantiateViewControllerWithIdentifier:@"movie"];
    MovieViewController *movie = [[MovieViewController alloc] init];
    movie.movnam=[_theList objectAtIndex:(indexPath.row)*4+1];
    movie.resnam=[_theList objectAtIndex:(indexPath.row)*4+2];
    movie.restyp=[_theList objectAtIndex:(indexPath.row)*4+3];
    movie.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:movie animated:YES];
    [movie release];
}

@end