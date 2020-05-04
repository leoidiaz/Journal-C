//
//  Entry.h
//  Journal-C
//
//  Created by Leonardo Diaz on 5/4/20.
//  Copyright © 2020 Leonardo Diaz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSObject

@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *bodyText;
@property(nonatomic, copy)NSDate *timestamp;
- (instancetype)initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText
                    timeStamp:(NSDate *)timeStamp;

- (instancetype)initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText;


@end

NS_ASSUME_NONNULL_END
