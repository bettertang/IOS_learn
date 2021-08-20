//
//  ListLoad.h
//  SampleApp
//
//  Created by better_yst on 2021/8/18.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import <Foundation/Foundation.h>
//数据加载
NS_ASSUME_NONNULL_BEGIN
@class Listitem;
typedef void(^ListitemFinish)(Boolean success,NSArray<Listitem *> *data);

@interface ListLoad : NSObject
-(void) LoadlistFinshBlock:(ListitemFinish) finshblock;
@end

NS_ASSUME_NONNULL_END
