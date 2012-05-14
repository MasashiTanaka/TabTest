//
//  TwitterTableViewController.m
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "InfoTableViewController.h"
#import "URLLoader.h"
#import "InfoStatusXMLParser.h"

@interface InfoTableViewController ()

@end

@implementation InfoTableViewController
@synthesize statuses;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Information", @"Information");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    [self loadTimeLineByUserName];
}

// （6）
- (void) loadTimeLineByUserName {
    NSString *url = @"http://www.seesaa.co.jp/news/index20.rdf";
    
    URLLoader *loder = [[[URLLoader alloc] init] autorelease];
    
    [[NSNotificationCenter defaultCenter] addObserver: self                         
                                             selector: @selector(loadTimeLineDidEnd:)
                                                 name: @"connectionDidFinishNotification"
                                               object: loder];
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(loadTimeLineFailed:)
                                                 name: @"connectionDidFailWithError"
                                               object: loder];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [loder loadFromUrl:url method: @"GET"];
}

// （7）
- (void) loadTimeLineDidEnd: (NSNotification *)notification {
    URLLoader *loder = (URLLoader *)[notification object];
    NSData *xmlData = loder.data;
    
    InfoStatusXMLParser *parser = [[[InfoStatusXMLParser alloc] init] autorelease];
    self.statuses = [parser parseStatuses:xmlData];
    [self.tableView reloadData];
}

// （8）
- (void) loadTimeLineFailed: (NSNotification *)notification {
    
    UIAlertView *alert = [[UIAlertView alloc]  
                          initWithTitle:@"エラー"  
                          message:@"タイムラインの取得に失敗しました。"  
                          delegate:self
                          cancelButtonTitle:@"閉じる"  
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

// （14）
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.statuses count];
}

//（15）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    int row = [indexPath row];
    
    NSString *title = [[statuses objectAtIndex:row] objectForKey:@"title"];
    NSString *description = [[statuses objectAtIndex:row] objectForKey:@"description"];
    
    // ユーザー名
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = title;
    
    // テキスト
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.text = description;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {   
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:indexPath];
    
    CGSize bounds = CGSizeMake(self.tableView.frame.size.width - 150, self.tableView.frame.size.height);
    
    CGSize size = [cell.detailTextLabel.text sizeWithFont: cell.detailTextLabel.font 
                                        constrainedToSize: bounds 
                                            lineBreakMode: UILineBreakModeCharacterWrap];
    return size.height;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

/*
- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
 
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
