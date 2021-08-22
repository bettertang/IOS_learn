//
//  VideoCollectionViewCell.h
//  SampleApp
//
//  Created by better_yst on 2021/8/22.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoCollectionViewCell : UICollectionViewCell
-(void) layoutVideoWithCoverurl:(NSString *)videoCover VideoUrl:(NSString *) videoUrl;
@end

NS_ASSUME_NONNULL_END
