//
//  Entry.m
//  Journal-C
//
//  Created by Leonardo Diaz on 5/4/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import "Entry.h"

@implementation Entry
#pragma mark - String Keys
static NSString * const TitleKey = @"title";
static NSString * const BodyTextKey = @"bodyText";
static NSString * const TimeStampKey = @"timestamp";

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

#pragma mark - Default Init
- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    self = [self initWithTitle:title bodyText:bodyText timeStamp:[NSDate date]];
    return self;
}

- (NSDictionary *)dictionaryCopy
{
    return @{TitleKey: _title, BodyTextKey: _bodyText, TimeStampKey: _timestamp};
}

#pragma mark - Dictionary Init
- (instancetype)initWithDict:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *bodyText = dictionary[BodyTextKey];
    NSDate *timestamp = dictionary[TimeStampKey];
    return [self initWithTitle:title bodyText:bodyText timeStamp:timestamp];
}

- (BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[Entry class]]) { return NO; }
    // Shortcut to comparing all properties one by one. We let NSDictionary do it for us
    return [[self dictionaryCopy] isEqualToDictionary:[(Entry *)object dictionaryCopy]];
}



@end
