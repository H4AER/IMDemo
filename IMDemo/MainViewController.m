//
//  MainViewController.m
//  IMDemo
//
//  Created by liuyaoheng on 2017/11/23.
//  Copyright © 2017年 liuyaoheng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *enter;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [ChatDemoHelper shareHelper].mainVC = self;
    
    [[EMClient sharedClient] loginWithUsername:@"你的账号"
                                      password:@"你的密码"
                                    completion:^(NSString *aUsername, EMError *aError) {
                                        if (!aError) {
                                            NSLog(@"登录成功");
                                            _enter.enabled = YES;
                                        } else {
                                            NSLog(@"登录失败");
                                            _enter.enabled = NO;
                                        }
                                    }];
}
- (IBAction)enterChat:(id)sender {
    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:@"对方账号" conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:chatController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
