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
@property (nonatomic,strong,readwrite)  UIProgressView *progressV;
@end

@implementation WebViewController

-(void) dealloc{
    [self.mywebView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mywebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
    [self.view addSubview:self.mywebView];
    NSString *inputUrl = @"https://www.baidu.com";
    self.progressV = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
    [self.view addSubview:self.progressV];
    [self.mywebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:inputUrl]]];
    
    [self.mywebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    self.progressV.progress = self.mywebView.estimatedProgress;
    NSLog(@"监听回调%f",self.mywebView.estimatedProgress);
}



    



@end
