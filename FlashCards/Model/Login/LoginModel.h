//
//  LoginModel.h
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

- (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(BOOL success))completion;

@end
