//
//  VideoPlayer.m
//  SampleApp
//
//  Created by better_yst on 2021/8/22.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "VideoPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "VideoCollectionViewCell.h"


@interface VideoPlayer()
@property(nonatomic,strong,readwrite) AVPlayerItem *myPlayerItem;
@property(nonatomic,strong,readwrite) AVPlayerLayer *myPlayerLayer;
@property(nonatomic,strong,readwrite) AVPlayer *myPlayer;

@end

@implementation VideoPlayer

+(VideoPlayer *)Player{
    static VideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        player = [[VideoPlayer alloc] init];
    });
    return player;
}

-(void) PlayerWithUrl:(NSString *)PlayerUrl touchView:(UIView *) touchView{
        [self _stopPlay];
    
        NSURL *videoUrl = [NSURL URLWithString:PlayerUrl];
        AVAsset *myAsset = [AVAsset assetWithURL:videoUrl];
        _myPlayerItem = [AVPlayerItem playerItemWithAsset:myAsset];
        [_myPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        [_myPlayerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
        
       // CMTime myDuration=_myPlayerItem.duration;
       // CGFloat videoDuration = CMTimeGetSeconds(myDuration);
        
       // self.myPlayer = [AVPlayer playerWithURL:videoUrl];
        _myPlayer = [AVPlayer playerWithPlayerItem:_myPlayerItem];
    
       [_myPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度:%@",@(CMTimeGetSeconds(time)));
    }];
        _myPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:_myPlayer];
        _myPlayerLayer.frame= touchView.bounds;
        [touchView.layer addSublayer:_myPlayerLayer];
    
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}

-(void)_stopPlay{
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    
        [_myPlayerItem removeObserver:self forKeyPath:@"status"];
        [_myPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
        _myPlayerItem=nil;
    
        [_myPlayerLayer removeFromSuperlayer];
        _myPlayer=nil;
}


-(void)_handlePlayEnd{
    [_myPlayer seekToTime:CMTimeMake(0, 1)];//重新设置时间
    [_myPlayer play];//播放
}


- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context
{
    if([keyPath isEqualToString:@"status"]){
        
        if(((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue==AVPlayerItemStatusReadyToPlay){
             [_myPlayer play];
        }else {
           // NSLog(@"video url is %@",self.videoUrl);
        }
       
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
       // NSLog(@"缓冲:%@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}



@end
