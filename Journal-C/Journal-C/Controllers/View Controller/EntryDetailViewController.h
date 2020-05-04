//
//  EntryDetailViewController.h
//  Journal-C
//
//  Created by Leonardo Diaz on 5/4/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong)Entry *entry;
- (void)updateWith:(Entry *)entry;

@end

NS_ASSUME_NONNULL_END
