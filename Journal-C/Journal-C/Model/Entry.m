//
//  Entry.m
//  Journal-C
//
//  Created by Leonardo Diaz on 5/4/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import "Entry.h"

@implementation Entry

- (instancetype)initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText
                    timeStamp:(NSDate *)timeStamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodyText = bodyText;
        _timestamp = timeStamp;
    }
    return self;
}


- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    self = [self initWithTitle:title bodyText:bodyText timeStamp:[NSDate date]];
    return self;
}

@end
