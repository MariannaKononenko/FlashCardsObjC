//
//  UIAlertAction+Custom.m
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIAlertAction+Custom.h"

@implementation UIAlertAction (CustomActions)

+ (UIAlertAction *)okAction {
    return [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
}

@end
