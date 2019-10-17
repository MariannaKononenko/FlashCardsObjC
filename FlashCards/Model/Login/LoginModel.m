//
//  LoginModel.m
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

- (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(BOOL success))completion {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BOOL success = [email isEqual:@"test@example.com"] && [password isEqual: @"Password_123"];
        completion(success);
    });
}

@end
