//
//  CollectionViewController.m
//  SampleApp
//
//  Created by better_yst on 2021/8/15.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "CollectionViewController.h"
#import "VideoCollectionViewCell.h"

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation CollectionViewController

-(instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title =@"Collection";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *mylayout= [[UICollectionViewFlowLayout alloc] init];
    mylayout.minimumLineSpacing=10;
    mylayout.minimumInteritemSpacing=10;
    mylayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width/16*9);
    
    UICollectionView *myCollection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:mylayout];
    myCollection.delegate = self;
    myCollection.dataSource =self;
    
    [myCollection registerClass:[VideoCollectionViewCell class] forCellWithReuseIdentifier:@"VideoID"];
    
    [self.view addSubview:myCollection];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    VideoCollectionViewCell *mycell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoID" forIndexPath:indexPath];
    if([mycell isKindOfClass:[VideoCollectionViewCell class]]){
        NSLog(@"");
        
        [((VideoCollectionViewCell *)mycell) layoutVideoWithCoverurl:@"icon.bundle/icon.png" VideoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4" ];
    }
    
    return mycell;
}


//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    if(indexPath.item % 3 ==0){
//         return  CGSizeMake(self.view.frame.size.width, 100);
//    }else{
//
//         return  CGSizeMake((self.view.frame.size.width-10)/2, 300);
//    }
//
//
//}


@end
