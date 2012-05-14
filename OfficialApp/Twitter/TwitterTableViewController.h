//
//  TwitterTableViewController.h
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterTableViewController : UITableViewController {
    NSArray *statuses;
}

@property(retain, nonatomic) NSArray *statuses;

@end
