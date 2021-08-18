//
//  Listitem.h
//  SampleApp
//
//  Created by better_yst on 2021/8/19.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface Listitem : NSObject
@property(nonatomic,strong,readwrite) NSString *category;
@property(nonatomic,strong,readwrite) NSString * thumbnail_pic_s;
@property(nonatomic,strong,readwrite) NSString *uniquekey;
@property(nonatomic,strong,readwrite) NSString *title;
@property(nonatomic,strong,readwrite) NSString *date;
@property(nonatomic,strong,readwrite) NSString *author_name;
@property(nonatomic,strong,readwrite) NSString *thumbnail_pic_s03;
@property(nonatomic,strong,readwrite) NSString *thumbnail_pic_s02;
@property(nonatomic,strong,readwrite) NSString *url;

-(void) confi:(NSDictionary*) dic;
@end


NS_ASSUME_NONNULL_END
