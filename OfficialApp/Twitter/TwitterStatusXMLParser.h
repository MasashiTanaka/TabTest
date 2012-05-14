//
//  StatusXMLParser.h
//  OfficialApp
//
//  Created by 雅士 田中 on 12/05/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwitterStatusXMLParser : NSObject <NSXMLParserDelegate> {
    NSMutableString *currentXpath;
    NSMutableArray *statuses;
    NSMutableDictionary *currentStatus;
    NSMutableString *textNodeCharacters;
}

@property (retain , nonatomic) NSMutableString *currentXpath;
@property (retain , nonatomic) NSMutableArray *statuses;
@property (retain , nonatomic) NSMutableDictionary *currentStatus;
@property (retain , nonatomic) NSMutableString *textNodeCharacters;

- (NSArray *) parseStatuses: (NSData *) xmlData;

@end