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
#pragma mark - EntriesKey
static NSString * const EntriesKey = @"entries";

#pragma mark - Shared Instance
+(EntryController *)shared
{
    static EntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [EntryController new];
        [shared loadFromPersistentStorage];
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
    Entry *newEntry = [[Entry alloc] initWithTitle:title bodyText:bodyText];
    
    [_entries addObject:newEntry];
    [self saveToPersistentStorage];
}

#pragma mark - Update Entry
- (void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText timeStamp:(NSDate *)timeStamp
{
    entry.title = title;
    entry.bodyText = bodyText;
    entry.timestamp = timeStamp;
    [self saveToPersistentStorage];
}

#pragma mark - Remove Entry
- (void)removeEntry:(Entry *)entry
{
    [_entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)addDictObject:(Entry *)entry;
{
    [_entries addObject:entry];
    [self saveToPersistentStorage];
}


#pragma mark - Persistence

- (void)loadFromPersistentStorage
{
    NSArray *entryDict = [[NSUserDefaults standardUserDefaults] objectForKey: EntriesKey];
    
    for (NSDictionary *dictionary in entryDict) {
        Entry *entry = [[Entry alloc] initWithDict:dictionary];
        [self addDictObject:entry];
    }
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in _entries){
        [entryDictionaries addObject:entry.dictionaryCopy];
    }
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}


@end
