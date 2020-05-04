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

-(void)addEntry:(Entry *)entry;

-(void)removeEntry:(Entry *)entry;


@end

NS_ASSUME_NONNULL_END
