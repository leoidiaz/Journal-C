//
//  EntryController.m
//  Journal-C
//
//  Created by Leonardo Diaz on 5/4/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"

@implementation EntryController

#pragma mark - Shared Instance
+(EntryController *)shared
{
    static EntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [EntryController new];
    });
    return shared;
}

#pragma mark - Init
- (instancetype)init
{
    self = [super init];
    if (self) {
        _entries = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Add Entry
- (void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText
{
    Entry *newEntry = [[Entry alloc]
                       initWithTitle:title bodyText:bodyText];
    
    [_entries addObject:newEntry];
}

#pragma mark - Update Entry
- (void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText
{
    entry.title = title;
    entry.bodyText = bodyText;
}

#pragma mark - Remove Entry
- (void)removeEntry:(Entry *)entry
{
    [_entries removeObject:entry];
}


@end
