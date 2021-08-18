//
//  ViewController.h
//  SampleApp
//
//  Created by better_yst on 2021/8/11.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, readonly) NSArray *author;
@property (nonatomic, readonly) NSDictionary *book;
@end

