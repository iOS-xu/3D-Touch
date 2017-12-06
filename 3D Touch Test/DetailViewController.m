//
//  DetailViewController.m
//  3D Touch Test
//
//  Created by 韩旭 on 2017/12/5.
//  Copyright © 2017年 szsxrkj. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property(nonatomic,strong)UIImageView * mainImageView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


/**
 搭建界面
 */
-(void)setupUI{
    //图片imageView
    UIImageView * mainImageView = [[UIImageView alloc] init];
    mainImageView.image = [UIImage imageNamed:self.imageViewStr];
    mainImageView.frame = self.view.bounds;
    [self.view addSubview:mainImageView];
    self.mainImageView = mainImageView;
}



/**
   当轻按时 往上移的Action
 */
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction *action1  =[UIPreviewAction actionWithTitle:@"赞赞赞" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    }];
    UIPreviewAction *action2  =[UIPreviewAction actionWithTitle:@"一般般" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
    }];
    
    return @[action1,action2];
}
@end
