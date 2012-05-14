//
//  PhotoViewController.m
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoImageViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Photo", @"Photo");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    // サムネイル作成
    [self createThumNail];
}

// サムネイル作成
- (void)createThumNail {
    // scrollView作成
    CGSize size = self.view.frame.size;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    
    // サムネイル作成
    NSArray *nameArray = [[NSArray alloc] initWithObjects:@"Argentina", @"Australia", @"Austria", @"Belgium", @"Cameroon", @"Canada", @"China", @"Chile", @"Denmark", nil];
    nameArray_ = nameArray;

    NSInteger row = 0;
    NSInteger col = 0;
    NSInteger maxCol = 3;
    NSInteger margin = 40;
    double width = 50;
    double height = 50;
    
    for (NSInteger i = 0; i < [nameArray count]; i++) {
        if (col == maxCol) {col = 0; row++;}
        
        //UIImage *image = [UIImage imageNamed:[array objectAtIndex:i]];
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:[nameArray objectAtIndex:i] ofType:@"gif"];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
        
        // 座標計算
        //double iColBlock = scrollView.frame.size.width/maxCol;
        double firstColMargin = (scrollView.frame.size.width-((width*maxCol)+(margin*(maxCol-1))))/2;
        double firstoRowMargin = 20;
        //double x = (iColBlock*col)+(iColBlock-width)/2;
        double x = firstColMargin+(width*col)+(margin*col);
        double y = firstoRowMargin+(height*row)+(margin*row);
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y , width, height)];

        button.tag = i;
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button addTarget:self action:@selector(pressThumNail:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button];

        col++;
        
        [image release];
        [button release];
    }
    
    [scrollView release];
    //[nameArray release];
}

// thumNail press
- (void)pressThumNail:(UIButton*)button {
    PhotoImageViewController *photoImageController = [[PhotoImageViewController alloc] init];
    photoImageController._fileName = [nameArray_ objectAtIndex:button.tag];
    [self.navigationController pushViewController:photoImageController animated:YES];

    [photoImageController release];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
