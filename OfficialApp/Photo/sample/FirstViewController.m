//
//  FirstViewController.m
//  TabTest
//
//  Created by 雅士 田中 on 12/05/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"




@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize scrollView;
@synthesize bigImg;




- (void)viewDidLoad
{   
    
    [super viewDidLoad];
    
    
    //ナビゲーションバーのタイトル
    self.navigationItem.title = @"PHOTO";
    
    //スクロールサイズ
    scrollView.contentSize = CGSizeMake(300, 500);
    
    //タブのタイトル
    //self.title = @"PHOTO";
    
   // UIImageView *iv = [[UIImageView alloc] init];
    
/*    NSString *str = [[NSString alloc] init];
    str = @"写真ギャラリー";
    UILabel *myLabel = [[UILabel alloc] init];
    //UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    myLabel.text = str;
    myLabel.frame = CGRectMake(100, 5, 200, 20);
    
    [scrollView addSubview:myLabel];
*/ 

   // for (NSInteger i = 0; i < 5; i++) {
     
/*    
    UIImage *image = [UIImage imageNamed:@"Argentina.gif"];
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    iv.image = image;
    iv.frame = CGRectMake(30, 5 , 50, 50);
    //iv.frame = CGRectMake(100, (i * 50) + (5 * i), 50, 50);
    [scrollView addSubview:iv];
    
    UIImage *image2 = [UIImage imageNamed:@"Australia.gif"];
    UIImageView *iv2 = [[UIImageView alloc] initWithImage:image];
    iv2.image = image2;
    iv2.frame = CGRectMake(130, 5, 50, 50);
    [scrollView addSubview:iv2];
    
    UIImage *image3 = [UIImage imageNamed:@"Austria.gif"];
    UIImageView *iv3 = [[UIImageView alloc] initWithImage:image];
    iv3.image = image3;
    iv3.frame = CGRectMake(230, 5, 50, 50);
    [scrollView addSubview:iv3];
    
    UIImage *image4 = [UIImage imageNamed:@"Belgium.gif"];
    UIImageView *iv4 = [[UIImageView alloc] initWithImage:image];
    iv4.image = image4;
    iv4.frame = CGRectMake(30, 105, 50, 50);
    [scrollView addSubview:iv4];
    
    UIImage *image5 = [UIImage imageNamed:@"Cameroon.gif"];
    UIImageView *iv5 = [[UIImageView alloc] initWithImage:image];
    iv5.image = image5;
    iv5.frame = CGRectMake(130, 105, 50, 50);
    [scrollView addSubview:iv5];
    
    UIImage *image6 = [UIImage imageNamed:@"Canada.gif"];
    UIImageView *iv6 = [[UIImageView alloc] initWithImage:image];
    iv6.image = image6;
    iv6.frame = CGRectMake(230, 105, 50, 50);
    [scrollView addSubview:iv6];
    
    UIImage *image7 = [UIImage imageNamed:@"Chile.gif"];
    UIImageView *iv7 = [[UIImageView alloc] initWithImage:image];
    iv7.image = image7;
    iv7.frame = CGRectMake(30, 205, 50, 50);
    [scrollView addSubview:iv7];
    
    UIImage *image8 = [UIImage imageNamed:@"China.gif"];
    UIImageView *iv8 = [[UIImageView alloc] initWithImage:image];
    iv8.image = image8;
    iv8.frame = CGRectMake(130, 205, 50, 50);
    [scrollView addSubview:iv8];
    
    UIImage *image9 = [UIImage imageNamed:@"Denmark.gif"];
    UIImageView *iv9 = [[UIImageView alloc] initWithImage:image];
    iv9.image = image9;
    iv9.frame = CGRectMake(230, 205, 50, 50);
    [scrollView addSubview:iv9];
    
*/    
   
    UIImage *image = [UIImage imageNamed:@"Argentina.gif"];
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(30, 5 , 50, 50)];
    button1.tag = 1;
    [button1 setBackgroundImage:image forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button1];
    
    UIImage *image2 = [UIImage imageNamed:@"Australia.gif"];
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(130, 5 , 50, 50)];
    button2.tag = 2;
    [button2 setBackgroundImage:image2 forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button2];
    
    UIImage *image3 = [UIImage imageNamed:@"Austria.gif"];
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(230, 5 , 50, 50)];
    button3.tag = 3;
    [button3 setBackgroundImage:image3 forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button3];
    
    UIImage *image4 = [UIImage imageNamed:@"Belgium.gif"];
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(30, 105 , 50, 50)];
    button4.tag = 4;
    [button4 setBackgroundImage:image4 forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button4];
    
    UIImage *image5 = [UIImage imageNamed:@"Cameroon.gif"];
    UIButton *button5 = [[UIButton alloc] initWithFrame:CGRectMake(130, 105 , 50, 50)];
    button5.tag = 5;
    [button5 setBackgroundImage:image5 forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button5];
    
    UIImage *image6 = [UIImage imageNamed:@"Canada.gif"];
    UIButton *button6 = [[UIButton alloc] initWithFrame:CGRectMake(230, 105 , 50, 50)];
    button6.tag = 6;
    [button6 setBackgroundImage:image6 forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button6];
    
    UIImage *image7 = [UIImage imageNamed:@"China.gif"];
    UIButton *button7 = [[UIButton alloc] initWithFrame:CGRectMake(30, 205 , 50, 50)];
    button7.tag = 7;
    [button7 setBackgroundImage:image7 forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button7];
    
    UIImage *image8 = [UIImage imageNamed:@"Chile.gif"];
    UIButton *button8 = [[UIButton alloc] initWithFrame:CGRectMake(130, 205 , 50, 50)];
    button8.tag = 8;
    [button8 setBackgroundImage:image8 forState:UIControlStateNormal];
    [button8 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button8];
    
    UIImage *image9 = [UIImage imageNamed:@"Denmark.gif"];
    UIButton *button9 = [[UIButton alloc] initWithFrame:CGRectMake(230, 205 , 50, 50)];
    button9.tag = 9;
    [button9 setBackgroundImage:image9 forState:UIControlStateNormal];
    [button9 addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:button9];

}

//- (void)pressImage:(UIButton*)button {
- (void)pressImage:(id)sender {
    
    UIButton *button = sender;
    NSString *fileName = @"";

    switch (button.tag) {
        case 1: fileName = @"Argentina.gif"; break;
        case 2: fileName = @"Australia.gif"; break;
        case 3: fileName = @"Austria.gif"; break;
        case 4: fileName = @"Belgium.gif"; break;
        case 5: fileName = @"Cameroon.gif"; break;
        case 6: fileName = @"Canada.gif"; break;
        case 7: fileName = @"China.gif"; break;
        case 8: fileName = @"Chile.gif"; break;
        case 9: fileName = @"Denmark.gif"; break;
        default: fileName = @"Australia.gif"; break;
    }
    
        SecondViewController *sec=[self.storyboard instantiateViewControllerWithIdentifier:@"sec"];
    sec.fileName = fileName;
    [self.navigationController pushViewController:sec animated:YES];
    

}






- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setBigImg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
