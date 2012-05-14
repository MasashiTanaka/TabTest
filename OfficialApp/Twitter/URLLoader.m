//
//  URLLoader.m
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "URLLoader.h"

@implementation URLLoader

@synthesize connection;
@synthesize data;

// （1）
- (void) connection:(NSURLConnection *)connection 
 didReceiveResponse:(NSURLResponse *)response {
    self.data = [NSMutableData data];
}

// （2）
-(void) connection:(NSURLConnection *)connection 
    didReceiveData:(NSData *)receiveData {
    [self.data appendData:receiveData];
}

// （3）
- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [[NSNotificationCenter defaultCenter] 
     postNotificationName: @"connectionDidFinishNotification" 
     object: self];
}

// （4）
- (void) connection:(NSURLConnection *)connection 
   didFailWithError:(NSError *)error {
    [[NSNotificationCenter defaultCenter] 
     postNotificationName: @"connectionDidFailWithError" 
     object: self];
}

// （5）
- (void) loadFromUrl: (NSString *)url method: (NSString *) method {
    NSMutableURLRequest *req = 
    [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [req setHTTPMethod:method];
    self.connection = [NSURLConnection connectionWithRequest:req delegate:self];
}

- (void)dealloc {
    [connection release];
    [data release];
    [super dealloc];
}

@end