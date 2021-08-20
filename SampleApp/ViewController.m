//
//  ViewController.m
//  SampleApp
//
//  Created by better_yst on 2021/8/11.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "WebViewController.h"
#import "DeletView.h"
#import "ListLoad.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,MytableDelegate>

@property(nonatomic,strong) UITableView *mytableview;
@property(nonatomic,strong,readwrite) NSMutableArray *Darry;
@property(nonatomic,strong,readwrite) ListLoad *listLoad;
@end

@implementation ViewController
NSDictionary* tableData;
NSArray  *storys;


#pragma mark - Init

-(instancetype)init{
    self = [super self];
    if(self){
        _Darry = @[].mutableCopy;
        for(int i=0;i<5;++i){
            [_Darry addObject:@(i)];
        }
    }
    
    return self;
}

//static int count;

- (void)viewDidLoad {
     [super viewDidLoad];
//self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
    
//    [self.view addSubview:({
//        UILabel *mylabel = [[UILabel alloc] init];
//        mylabel.text =@"hello world yst";
//        [mylabel sizeToFit];
//        mylabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
//        mylabel;
//    })];
    
    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    view1.backgroundColor = [UIColor redColor];
//
//    [self.view addSubview:view1];
//
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
//     view2.backgroundColor = [UIColor greenColor];
//
//    [self.view addSubview:view2];
//
//
//    UITapGestureRecognizer *mytapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(pushControler)];
//
//    [view2 addGestureRecognizer:mytapGesture];
    _mytableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _mytableview.delegate=self;
    _mytableview.dataSource=self;
    
    self.listLoad = [[ListLoad alloc] init];
    [self.listLoad LoadlistFinshBlock:^(Boolean success, NSArray<Listitem *> * _Nonnull data) {
        NSLog(@"");
    }];
    [self.view addSubview:_mytableview];
    
   tableData = [NSDictionary dictionaryWithObjectsAndKeys:
   [NSArray arrayWithObjects:@"孙悟空" , @"猪八戒", @"牛魔王"
    , @"蜘蛛精"  , @"唐僧" , @"沙和尚" , nil] , @"西游记",
   [NSArray arrayWithObjects:@"宝玉" , @"黛玉", @"元春"
    , @"探春"  , @"惜春" , @"可卿" , nil] , @"红楼梦",
   [NSArray arrayWithObjects:@"武松" , @"林冲", @"鲁达"
    , @"杨志"  , @"宋江" , @"史进" , nil] , @"水浒",
   [NSArray arrayWithObjects:@"关羽" , @"刘备", @"张飞"
    , @"曹操"  , @"张辽" , @"吕布" , nil] , @"三国演义", nil];
    
    storys = [tableData allKeys];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 20;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

//    NSString *story = [storys objectAtIndex:section];
    //return [[tableData objectForKey:story] count];
    return self.Darry.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WebViewController *newVC = [[WebViewController alloc] init];
    newVC.title = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:newVC animated:NO];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSUInteger *section = indexPath.section;
//    NSUInteger *row =
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID" ];
    if(cell==nil){
        cell =  [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
        
        cell.delegate=self;
    }
    [cell layoutTableCell];
    
//    NSString *story = [storys objectAtIndex:indexPath.section];
//
    //cell.detailTextLabel.text=[[tableData objectForKey:story] objectAtIndex:indexPath.row];
    //cell.textLabel.text=@"主标题";
    return cell;
}


-(void) tableviewCell:(UITableViewCell *) inputTBview deletebutton:(UIButton *)deletbutton message:(nonnull NSString *)mes{
    NSLog(@"收到代理信息: %@",mes);
    DeletView *myDelView = [[DeletView alloc] initWithFrame:self.view.bounds];
    CGRect rec = [inputTBview convertRect:myDelView.frame toView:nil];
    __weak typeof (self) wself = self;
    [myDelView showDelView:rec.origin clickblock:^{
    __strong typeof (self) Sself = wself;
    [Sself.Darry removeLastObject];
    if([Sself.mytableview indexPathForCell:inputTBview]){
        [Sself.mytableview deleteRowsAtIndexPaths:@[[Sself.mytableview indexPathForCell:inputTBview]] withRowAnimation:UITableViewRowAnimationAutomatic];
                   NSLog(@"执行成功");
        }
    }];
}


//
//- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection
//                      :(NSInteger)section
//{
//    return [storys objectAtIndex:section];
//}








//
//-(void) pushControler{
//    count+=1;
//    ViewController *newVc = [[ViewController alloc] init];
//    newVc.view.backgroundColor = [UIColor blueColor];
//    newVc.navigationItem.title = [NSString stringWithFormat:@"第%d页面",count];
//
//    newVc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧内容" style:UIBarButtonItemStyleDone target:self action:nil];
//
//    [self.navigationController pushViewController:newVc animated:YES];
//
//}


@end
