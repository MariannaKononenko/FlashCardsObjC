//
//  AlertHelper.m
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import "AlertHelper.h"

@implementation AlertHelper

- (UIAlertController *)createAlert:(AlertParams *)params {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:params.title message:params.message preferredStyle:params.style];
    for (UIAlertAction *action in params.actions) {
        [controller addAction:action];
    }
    return controller;
}

@end
