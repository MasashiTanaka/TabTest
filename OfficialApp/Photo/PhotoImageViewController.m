//
//  SecondViewController.m
//  TabTest
//
//  Created by 雅士 田中 on 12/05/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PhotoImageViewController.h"

@interface PhotoImageViewController ()

@end

@implementation PhotoImageViewController
@synthesize _fileName;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:_fileName ofType:@"gif"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    iv.frame = CGRectMake((self.view.frame.size.width-iv.frame.size.width)/2, 100 , iv.frame.size.width, iv.frame.size.height);
    [self.view addSubview:iv];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

@end
