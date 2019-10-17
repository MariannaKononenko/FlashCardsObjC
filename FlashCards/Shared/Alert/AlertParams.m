//
//  AlertParams.m
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import "AlertParams.h"

@implementation AlertParams

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"";
        self.message = @"";
        self.style = UIAlertControllerStyleAlert;
        self.actions = [NSMutableArray new];
    }
    return self;
}

- (id)initWithTitlle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style actions:(NSArray<UIAlertAction *> *) actions {
    self = [self init];
    if (self) {
        self.title = title;
        self.message = message;
        self.style = style;
        [self.actions addObjectsFromArray:actions];
    }
    return self;
}

@end
