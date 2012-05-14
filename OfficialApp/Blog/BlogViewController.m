//
//  FirstViewController.m
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/08.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BlogViewController.h"

@interface BlogViewController ()

@end

@implementation BlogViewController
@synthesize webView;

#define CONST_BLOG_URL @"http://blog.seesaa.jp/"

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Blog", @"Blog");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //UIToolbarの生成
    //UIToolbar *toolBar = [[[UIToolbar alloc]initWithFrame:CGRectMake(0, 414, 320, 46)]autorelease];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 46)];
    toolBar.barStyle = UIBarStyleBlack;
    //toolBar.autoresizesSubviews = YES;
    //toolBar.autoresizingMask = UIViewAutoresizingNone;
    
    //ホームボタンの生成
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]init];
    homeButton.title = @"Home";
    homeButton.style = UIBarButtonItemStyleBordered;
    homeButton.target = self;
    homeButton.action = @selector(goHome);
    
    //戻るボタンの生成
    UIBarButtonItem *goBackButton = [[UIBarButtonItem alloc]init];
    goBackButton.title = @"戻る";
    goBackButton.style = UIBarButtonItemStyleBordered;
    goBackButton.target = self;
    goBackButton.action = @selector(goBack);
    
    //進むボタンの生成
    UIBarButtonItem *goFowardButton = [[UIBarButtonItem alloc]init];
    goFowardButton.title = @"進む";
    goFowardButton.style = UIBarButtonItemStyleBordered;
    goFowardButton.target = self;
    goFowardButton.action = @selector(goFoward);
    
    //更新ボタンの生成
    UIBarButtonItem *reloadButton = [[UIBarButtonItem alloc]init];
    reloadButton.title = @"更新";
    reloadButton.style = UIBarButtonItemStyleBordered;
    reloadButton.target = self;
    reloadButton.action = @selector(reloadWebView);
    
    //ツールバーアイテムをツールバーに追加
    NSArray *elements = [NSArray arrayWithObjects:homeButton, goBackButton, goFowardButton, reloadButton, nil];

    [toolBar setItems:elements animated:NO];
    
    //ツールバーをビューに追加
    [self.view addSubview:toolBar];
    
    //NSLog(@"%@", toolBar);
    
    [homeButton release];
    [goBackButton release];
    [goFowardButton release];
    [reloadButton release];
    [toolBar release];
    
    //UIWebViewの生成
    //webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, toolBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - toolBar.frame.size.height - self.tabBarController.rotatingFooterView.frame.size.height)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:CONST_BLOG_URL]]];
    [self.view addSubview:webView];
    
}

- (void)goHome {
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:CONST_BLOG_URL]]];
}

- (void)goBack {
    [webView goBack];
    
}

- (void)goFoward {
    [webView goForward];
}

- (void)reloadWebView {
    [webView reload];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
