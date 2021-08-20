//
//  MyTableViewCell.h
//  SampleApp
//
//  Created by better_yst on 2021/8/15.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Listitem;
@protocol MytableDelegate <NSObject>

-(void) tableviewCell:(UITableViewCell *) inputTBview deletebutton:(UIButton *)deletbutton message:(NSString *) mes;

@end

@interface MyTableViewCell : UITableViewCell
-(void) layoutTableCellWithdata:(Listitem *)data;
@property(nonatomic,weak,readwrite) id<MytableDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
