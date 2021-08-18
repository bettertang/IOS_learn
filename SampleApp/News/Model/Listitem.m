//
//  Listitem.m
//  SampleApp
//
//  Created by better_yst on 2021/8/19.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "Listitem.h"

@implementation Listitem

-(void) confi:(NSDictionary*) dic{
     self.author_name=[dic objectForKey:@"author_name"];
     self.category=[dic objectForKey:@"category"];
     self.uniquekey=[dic objectForKey:@"uniquekey"];
     self.title=[dic objectForKey:@"title"];
     self.thumbnail_pic_s=[dic objectForKey:@"thumbnail_pic_s"];
     self.thumbnail_pic_s02=[dic objectForKey:@"thumbnail_pic_s02"];
     self.thumbnail_pic_s03=[dic objectForKey:@"thumbnail_pic_s03"];
     self.date=[dic objectForKey:@"date"];
     self.url=[dic objectForKey:@"url"];
    
}
@end
