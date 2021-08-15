//
//  ScrollController.m
//  SampleApp
//
//  Created by better_yst on 2021/8/15.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "ScrollController.h"

@interface ScrollController ()

@end

@implementation ScrollController

-(instancetype)init{
    self= [super init];
    if(self){
        self.tabBarItem.title= @"ScrollView";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor=[UIColor yellowColor];
    
    UIScrollView *myscrolview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //myscrolview.backgroundColor=[UIColor blueColor];
    myscrolview.contentSize = CGSizeMake(self.view.bounds.size.width*3, self.view.bounds.size.height);
    
    NSArray *bgColors = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor]];
    
    for(int i=0;i<3;++i){
        UIView *newView= [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        newView.backgroundColor=[bgColors objectAtIndex:i];
        
        [myscrolview addSubview:newView];
    }
    myscrolview.showsHorizontalScrollIndicator=NO;
    myscrolview.pagingEnabled=YES;
    [self.view addSubview:myscrolview];
}




@end
