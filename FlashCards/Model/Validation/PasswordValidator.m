//
//  PasswordValidator.m
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import "PasswordValidator.h"

@implementation PasswordValidator

//Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character from @$!%*?&_
NSString *const kPasswordRegex = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&_])[A-Za-z\\d@$!%*?&_]{8,}$";

- (BOOL)isPasswordValid:(NSString *)password {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kPasswordRegex];
    return [predicate evaluateWithObject:password];
}

@end
