//
//  ViewController.m
//  3D Touch Test
//
//  Created by 韩旭 on 2017/12/5.
//  Copyright © 2017年 szsxrkj. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
@property(nonatomic,strong)UITableView * detailTableView;
@property(nonatomic,strong)NSArray * arrayData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"3D Touch Demo";
    self.arrayData =@[@"方块A",@"梅花Q",@"黑桃J",@"红桃K"];
    [self setupUI];
    [self chooseTouch];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushDetail) name:@"pushDetail" object:nil];
}


/**
 搭建界面
 */
-(void)setupUI{
    //tableView
    UITableView * detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
    detailTableView.delegate = self;
    detailTableView.dataSource = self;
    detailTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:detailTableView];
    self.detailTableView = detailTableView;
    [detailTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


/**
 通知传值  根据不同的type值跳转图片不同
 */
-(void)pushDetail{
    [self.navigationController popToViewController:self animated:NO];
    
    DetailViewController *vc =[[DetailViewController alloc]init];
    
   
    
    if ([self.pushStr isEqualToString:@"num1"]) {
        
        vc.imageViewStr  = @"1.jpg";
        
    }else if([self.pushStr isEqualToString:@"num2"]) {
        
       vc.imageViewStr = @"2.jpg";
        
    }else if([self.pushStr isEqualToString:@"num3"]) {
        
       vc.imageViewStr  = @"3.jpg";
        
    }else if([self.pushStr isEqualToString:@"num4"]) {
        
        vc.imageViewStr  = @"4.jpg";
        
    }
    
    [self.navigationController pushViewController:vc animated:NO];

}

/**
 判断该设备是否支持3D Touch  并进行注册
 */
-(void)chooseTouch{
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        //注册
        [self registerForPreviewingWithDelegate:self sourceView:self.detailTableView];
    }else{
        NSLog(@"该设备不支持3D Touch");
    }
    
}

#pragma mark -tableView 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [_arrayData objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark -tableView 代理方法

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *vc = [[DetailViewController alloc] init];
    switch (indexPath.row) {
        case 0:
            vc.imageViewStr = @"1.jpg";
            break;
        case 1:
            vc.imageViewStr = @"2.jpg";
            break;
        case 2:
            vc.imageViewStr = @"3.jpg";
            break;
        case 3:
            vc.imageViewStr = @"4.jpg";
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - UIViewControllerPreviewingDelegate 代理方法

//轻按
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    NSIndexPath * indexPath = [self.detailTableView indexPathForRowAtPoint:location];
    UITableViewCell * cell = [self.detailTableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        return nil;
    }
    DetailViewController * vc = [[DetailViewController alloc] init];
    if (indexPath.row ==0) {
        vc.imageViewStr = @"1.jpg";
    }
    else if (indexPath.row ==1){
        vc.imageViewStr = @"2.jpg";
    }
    else if (indexPath.row ==2){
        vc.imageViewStr = @"3.jpg";
    }
    else if (indexPath.row ==3){
        vc.imageViewStr = @"4.jpg";
    }
    vc.preferredContentSize = CGSizeMake(0, 0);
    previewingContext.sourceRect = cell.frame;
    return vc;
};

//重按
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self.navigationController pushViewController:viewControllerToCommit animated:NO];
};

@end
