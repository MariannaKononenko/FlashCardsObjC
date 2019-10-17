//
//  PasswordValidator.h
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordValidator : NSObject

- (BOOL)isPasswordValid:(NSString *)password;

@end
