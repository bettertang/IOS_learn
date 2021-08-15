//
//  WebViewController.m
//  SampleApp
//
//  Created by better_yst on 2021/8/16.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>


@interface WebViewController ()
@property (nonatomic,strong) WKWebView *mywebView;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mywebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
    [self.view addSubview:self.mywebView];
    
    [self.mywebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://time.geekbang.org/"]]];
}



@end
