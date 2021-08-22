//
//  VideoCollectionViewCell.m
//  SampleApp
//
//  Created by better_yst on 2021/8/22.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "VideoCollectionViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "VideoPlayer.h"

@interface VideoCollectionViewCell()
@property(nonatomic,strong) UIImageView *CoverView;
@property(nonatomic,strong) UIImageView *Playicon;
@property(nonatomic,copy,readwrite) NSString *videoUrl;
@end

@implementation VideoCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _CoverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _CoverView;
        })];
        
        [_CoverView addSubview:({
                 _Playicon = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-50)/2, (frame.size.height-50)/2, 50, 50)];
            _Playicon.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
                 _Playicon;
             })];
        
        UITapGestureRecognizer *VideoGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToPlay)];
        [self addGestureRecognizer:VideoGesture];
    }
    
    return self;
    
}

#pragma mark private mehtod
-(void) tapToPlay{
   // VideoPlayer *player = [[VideoPlayer alloc] init];
    [[VideoPlayer Player] PlayerWithUrl:self.videoUrl touchView:self.CoverView];
    //之前一直出现crash是因为之前初始化的时候[ [VideoPlayer alloc] init ] 这样就不是单例了
    //[VideoPlayer Player]
}


#pragma mark public method
-(void) layoutVideoWithCoverurl:(NSString *)videoCover VideoUrl:(NSString *) videoUrl{
    self.videoUrl = videoUrl;
    self.CoverView.image = [UIImage imageNamed:videoCover];
     _Playicon.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
}


@end
