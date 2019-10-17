//
//  EmailValidator.m
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import "EmailValidator.h"

@implementation EmailValidator

NSString *const kEmailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

- (BOOL)isEmailValid:(NSString *)email {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kEmailRegex];
    return [predicate evaluateWithObject:email];
}

@end
