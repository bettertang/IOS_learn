//
//  ViewController.m
//  SampleApp
//
//  Created by better_yst on 2021/8/11.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation ViewController
NSDictionary* tableData;
NSArray  *storys;

static int count;

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
    UITableView *mytableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    mytableview.delegate=self;
    mytableview.dataSource=self;
    
    [self.view addSubview:mytableview];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return storys.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSString *story = [storys objectAtIndex:section];
    return [[tableData objectForKey:story] count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *newVC = [[UIViewController alloc] init];
    newVC.title = [NSString stringWithFormat:@"%ld",indexPath.row];
    [self.navigationController pushViewController:newVC animated:NO];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSUInteger *section = indexPath.section;
//    NSUInteger *row =
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID" ];
    if(cell==nil){
        cell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ID"];
    }
    
    NSString *story = [storys objectAtIndex:indexPath.section];
    
    cell.detailTextLabel.text=[[tableData objectForKey:story] objectAtIndex:indexPath.row];
   // cell.textLabel.text=@"主标题";
    return cell;
}



- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection
                      :(NSInteger)section
{
    return [storys objectAtIndex:section];
}

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
