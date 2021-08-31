//
//  SampleAppTests.m
//  SampleAppTests
//
//  Created by better_yst on 2021/8/31.
//  Copyright © 2021 better_yst. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface SampleAppTests : XCTestCase

@end

@implementation SampleAppTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"开始");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSLog(@"结束");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    ViewController *myVC = [[ViewController alloc] init];
    NSInteger getNum = [myVC TestMethod:3];
    NSLog(@"getNum:%d",getNum);
    XCTAssert(getNum<5);
    NSLog(@"测试功能");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
