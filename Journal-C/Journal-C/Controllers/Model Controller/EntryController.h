//
//  EntryController.h
//  Journal-C
//
//  Created by Leonardo Diaz on 5/4/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"
NS_ASSUME_NONNULL_BEGIN

@interface EntryController : NSObject

@property (nonatomic, strong)NSMutableArray *entries;

+(EntryController *)shared;

-(void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText;

-(void)updateEntry:(Entry *)entry title:(NSString *)title bodyText:(NSString *)bodyText;

-(void)removeEntry:(Entry *)entry;


@end

NS_ASSUME_NONNULL_END
