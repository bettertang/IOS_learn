//
//  MyTableViewCell.m
//  SampleApp
//
//  Created by better_yst on 2021/8/15.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "MyTableViewCell.h"
#import "Listitem.h"


@interface MyTableViewCell()
@property (nonatomic,strong,readwrite) UILabel *LabelDetail;
@property (nonatomic,strong,readwrite) UILabel *leftLabel;
@property (nonatomic,strong,readwrite) UILabel *RightLabel;
@property (nonatomic, strong, readwrite) UIImageView *rightImageView;


@property (nonatomic,strong) UIButton *deletButton;

@end

@implementation MyTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier API_AVAILABLE(ios(3.0)) {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.LabelDetail = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
        self.LabelDetail.font =  [UIFont systemFontOfSize:16];
        self.LabelDetail.textColor = [UIColor blackColor];
       // self.LabelDetail.backgroundColor=[UIColor greenColor];
        self.leftLabel =[[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
        self.leftLabel.font =  [UIFont systemFontOfSize:12];
        self.leftLabel.textColor = [UIColor grayColor];
      //  self.leftLabel.backgroundColor=[UIColor greenColor];
        self.RightLabel =[[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
        self.RightLabel.font =  [UIFont systemFontOfSize:12];
        self.RightLabel.textColor = [UIColor grayColor];
        
        
        [self.contentView addSubview:({
                 self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 100, 70)];
                 self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
                 self.rightImageView;
             })];
        
        
//        [self.contentView addSubview:({
//            self.deletButton =[[UIButton alloc] initWithFrame:CGRectMake(160, 80, 50, 20)];
//                   self.deletButton.backgroundColor =[UIColor blueColor];
//                   [self.deletButton setTitle:@"X" forState:UIControlStateNormal];
//                   [self.deletButton setTitle:@"V" forState:UIControlStateHighlighted];
//            
//            [self.deletButton addTarget:self action:@selector(clickDel:) forControlEvents:UIControlEventTouchUpInside];
//            
//            self.deletButton.layer.cornerRadius = 10;
//            self.deletButton.layer.masksToBounds = YES;
//            self.deletButton;
//        })];
//        
    
       // self.RightLabel.backgroundColor=[UIColor greenColor];
        
      //  [self.contentView addSubview:self.deletButton];
        [self.contentView addSubview:self.LabelDetail];
        [self.contentView addSubview:self.leftLabel];
        [self.contentView addSubview:self.RightLabel];
        
        self.RightLabel =[[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
               self.RightLabel.font =  [UIFont systemFontOfSize:12];
               self.RightLabel.textColor = [UIColor grayColor];
               
       
    }
    return self;
}



-(void) clickDel:(NSString *) mes{
    mes= @"准备代理";
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableviewCell:deletebutton:message:)]){
        [self.delegate tableviewCell:self   deletebutton:self.deletButton message:mes];
    }
}


-(void) layoutTableCellWithdata:(Listitem *)data{
    self.LabelDetail.text=data.title;
    self.leftLabel.text = data.category;
    self.RightLabel.text =data.author_name;
    
//    NSThread *ImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:data.thumbnail_pic_s03]]];
//           self.rightImageView.image = image;
//    }];
//    ImageThread.name=@"Run_ImageThread";
//    [ImageThread start];
//
     dispatch_queue_global_t DownloadThread = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(DownloadThread, ^{
          UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:data.thumbnail_pic_s03]]];
        dispatch_async(dispatch_get_main_queue(), ^{
              self.rightImageView.image = image;
        });
    });
    
}

@end
