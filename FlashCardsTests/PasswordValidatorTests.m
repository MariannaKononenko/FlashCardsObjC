//
//  PasswordValidatorTests.m
//  FlashCardsTests
//
//  Created by JetBrains on 15.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "PasswordValidator.h"

@interface PasswordValidatorTests : XCTestCase

@end

@implementation PasswordValidatorTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testValidPassword {
    PasswordValidator *passwordValidator = [PasswordValidator new];
    NSString *password = @"TestPassword1$";
    BOOL result = [passwordValidator isPasswordValid:password];
    XCTAssert(result == YES);
}

- (void)testInvalidPasswordTooShort {
    PasswordValidator *passwordValidator = [PasswordValidator new];
    NSString *password = @"Test1$";
    BOOL result = [passwordValidator isPasswordValid:password];
    XCTAssert(result == NO);
}

- (void)testInvalidPasswordNoNumbers {
    PasswordValidator *passwordValidator = [PasswordValidator new];
    NSString *password = @"TestPassword$";
    BOOL result = [passwordValidator isPasswordValid:password];
    XCTAssert(result == NO);
}

- (void)testInvalidPasswordNoUppercaseLetters {
    PasswordValidator *passwordValidator = [PasswordValidator new];
    NSString *password = @"testpassword1$";
    BOOL result = [passwordValidator isPasswordValid:password];
    XCTAssert(result == NO);
}

- (void)testInvalidPasswordNoLowercaseLetters {
    PasswordValidator *passwordValidator = [PasswordValidator new];
    NSString *password = @"TESTPASSWORD1$";
    BOOL result = [passwordValidator isPasswordValid:password];
    XCTAssert(result == NO);
}

- (void)testInvalidPasswordNoSpecialCharacters {
    PasswordValidator *passwordValidator = [PasswordValidator new];
    NSString *password = @"TestPassword1";
    BOOL result = [passwordValidator isPasswordValid:password];
    XCTAssert(result == NO);
}

@end
