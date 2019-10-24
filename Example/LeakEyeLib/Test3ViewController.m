//
//  Test3ViewController.m
//  LeakEyeLib_Example
//
//  Created by zhouxiang on 2019/10/24.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

#import "Test3ViewController.h"
typedef void (^BlockType)(void);

@interface Test3ViewController ()
@property (nonatomic, copy) BlockType block;
@property (nonatomic, assign) NSInteger timerCount;

@end

@implementation Test3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.block = ^(){
        NSLog(@"MFMemoryLeakViewController = %@",self);
        NSLog(@"MFMemoryLeakViewController = %zd",_timerCount);
    };
    
    self.block();

   
    
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
