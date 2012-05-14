//
//  URLLoader.h
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLLoader : NSObject {
    NSURLConnection *connection;
    NSMutableData   *data;
}

@property(retain, nonatomic) NSURLConnection *connection;
@property(retain ,nonatomic) NSMutableData *data;

- (void) loadFromUrl: (NSString *)url method:(NSString *) method;

@end