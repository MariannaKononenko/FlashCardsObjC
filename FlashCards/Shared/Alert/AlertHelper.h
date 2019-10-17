//
//  AlertHelper.h
//  FlashCards
//
//  Created by JetBrains on 01.09.19.
//  Copyright © 2019 JetBrains. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AlertParams.h"
#import "UIAlertAction+Custom.h"

@interface AlertHelper : NSObject

- (UIAlertController *)createAlert:(AlertParams *)params;

@end
