//
//  WebViewController.h
//  SampleApp
//
//  Created by better_yst on 2021/8/16.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Listitem;
@interface WebViewController : UIViewController
-(instancetype) initWithURl:(Listitem *) WebListitem;
   
@end

NS_ASSUME_NONNULL_END
