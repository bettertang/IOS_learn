//
//  VideoPlayer.h
//  SampleApp
//
//  Created by better_yst on 2021/8/22.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject
+(VideoPlayer *)Player;
-(void) PlayerWithUrl:(NSString *)videoUrl touchView:(UIView *) touchView;
@end

NS_ASSUME_NONNULL_END
