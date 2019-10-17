//
//  AlertParams.h
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertParams : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic) UIAlertControllerStyle style;
@property (nonatomic, strong) NSMutableArray<UIAlertAction *> *actions;

- (id)initWithTitlle:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style actions:(NSArray<UIAlertAction *> *) actions;

@end
