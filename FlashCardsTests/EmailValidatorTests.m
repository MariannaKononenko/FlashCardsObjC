//
//  EmailValidator.m
//  FlashCardsTests
//
//  Created by JetBrains on 15.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmailValidator.h"

@interface EmailValidatorTests : XCTestCase

@end

@implementation EmailValidatorTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testValidEmail {
    EmailValidator *emailValidator = [EmailValidator new];
    NSString *email = @"abcdef123@ghi456.jk";
    BOOL result = [emailValidator isEmailValid:email];
    XCTAssert(result == true);
}

- (void)testInvalidEmailNoTopLevelDomain {
    EmailValidator *emailValidator = [EmailValidator new];
    NSString *email = @"abcdef123@ghi456";
    BOOL result = [emailValidator isEmailValid:email];
    XCTAssert(result == false);
}

- (void)testInvalidEmailTopLevelDomainIsTooShort {
    EmailValidator *emailValidator = [EmailValidator new];
    NSString *email = @"abcdef123@ghi456.j";
    BOOL result = [emailValidator isEmailValid:email];
    XCTAssert(result == false);
}

- (void)testInvalidEmailTopLevelDomainIsTooLong {
    EmailValidator *emailValidator = [EmailValidator new];
    NSString *email = @"abcdef123@ghi456.jklmn";
    BOOL result = [emailValidator isEmailValid:email];
    XCTAssert(result == false);
}

- (void)testInvalidEmailNoAt {
    EmailValidator *emailValidator = [EmailValidator new];
    NSString *email = @"abcdef123.ghi456.jk";
    BOOL result = [emailValidator isEmailValid:email];
    XCTAssert(result == false);
}

- (void)testInvalidEmailMoreThanOneAt {
    EmailValidator *emailValidator = [EmailValidator new];
    NSString *email = @"abc@def123@ghi456.jk";
    BOOL result = [emailValidator isEmailValid:email];
    XCTAssert(result == false);
}

- (void)testInvalidEmailContainsSpecialCharacters {
    EmailValidator *emailValidator = [EmailValidator new];
    NSString *email = @"a,bc<de#f123@ghi456.jk";
    BOOL result = [emailValidator isEmailValid:email];
    XCTAssert(result == false);
}

@end
