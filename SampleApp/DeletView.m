//
//  DeletView.m
//  SampleApp
//
//  Created by better_yst on 2021/8/16.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "DeletView.h"
@interface DeletView ()

@property (nonatomic,strong) UIView *BackgroudView;
@property (nonatomic,strong) UIButton *DeleView;
@property (nonatomic,copy,readwrite) dispatch_block_t myBlock;
@end

@implementation DeletView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _BackgroudView = [[UIView alloc] initWithFrame:self.bounds];
        _BackgroudView.alpha=0.5;
        _BackgroudView.backgroundColor = [UIColor blackColor];
        UITapGestureRecognizer *delGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickDelView)];
        [_BackgroudView addGestureRecognizer:delGesture];
        _DeleView =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _DeleView.backgroundColor=[UIColor blueColor];
        
        [_DeleView addTarget:self action:@selector(clickDelView) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_BackgroudView];
        [self addSubview:_DeleView];
        
    }
    
    return self;
}


-(void) showDelView:(CGPoint) point clickblock:(dispatch_block_t) dispatch_b{
   [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    _myBlock = [dispatch_b copy];
//    [UIView animateWithDuration:1.f animations:^{
//        self.DeleView.frame = CGRectMake((self.bounds.size.width-200)/2, (self.bounds.size.height-200)/2, 200, 200);
//    } ];
    self.DeleView.frame = CGRectMake(point.x, point.y, 0, 0);
    [UIView animateWithDuration:1.f delay:0.f options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.DeleView.frame = CGRectMake((self.frame.size.width-200)/2,(self.frame.size.height-200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"动画播放完毕");
    }];

}




-(void) clickDelView{
    if(_myBlock){
        _myBlock();
    }
    
    [self removeFromSuperview];
    
}

@end
