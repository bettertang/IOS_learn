//
//  ListLoad.m
//  SampleApp
//
//  Created by better_yst on 2021/8/18.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "ListLoad.h"
#import "Listitem.h"
#import <AFNetworking.h>


@interface ListLoad()

@end

@implementation ListLoad


-(void) LoadlistFinshBlock:(ListitemFinish)finshblock{
    __unused NSString *InputUrl = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";
//
//    [[AFHTTPSessionManager manager] GET:InputUrl parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"开始执行");
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"开始执行");
//    }];

    
    
    NSURL *LoadUrl = [NSURL URLWithString:InputUrl];
   // NSURLRequest *myrequest = [NSURLRequest requestWithURL:LoadUrl];


    NSURLSession *mySession = [NSURLSession sharedSession];
  //  NSURLSessionTask *mySessionTask = [mySession dataTaskWithRequest:myrequest];
    NSURLSessionTask *mySessionTask = [mySession dataTaskWithURL:LoadUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSError *JsonErr;
         
        
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JsonErr];
    
        NSMutableArray *ListItemArry = @[].mutableCopy;
        NSArray *dataArry = [((NSDictionary*)[((NSDictionary *)jsonObj) objectForKey:@"result"]) objectForKey:@"data"];
        
        for(NSDictionary *info in dataArry){
            Listitem *myList = [[Listitem alloc] init];
            [myList confi:info];
            [ListItemArry addObject:myList];
            
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if(finshblock){
                      finshblock(error==nil,ListItemArry.copy);
                  }
        });
        
      
        NSLog(@"");
    }];

    [mySessionTask resume];
}


@end
