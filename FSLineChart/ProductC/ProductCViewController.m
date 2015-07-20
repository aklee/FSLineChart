//
//  ProductCViewController.m
//  JiuCai
//
//  Created by ak on 15/7/17.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//



#import "ProductCViewController.h"


#import "ProductChartView.h"
 
@interface ProductCViewController ()
@property(nonatomic,strong)NSArray* chartModelArr ;
@property(nonatomic,strong) ProductChartView*pCView;

@property (weak, nonatomic) IBOutlet UIView *cv;

- (IBAction)typeChange:(id)sender;


@end

@implementation ProductCViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    ChartModel*m1=[ChartModel modelWithName:@"05-1" value:0.1];
    ChartModel*m2=[ChartModel modelWithName:@"05-2" value:0.5];
    ChartModel*m3=[ChartModel modelWithName:@"05-3" value:0.12];
    ChartModel*m4=[ChartModel modelWithName:@"05-4" value:0.4];
    ChartModel*m5=[ChartModel modelWithName:@"05-5" value:0.1];
    ChartModel*m6=[ChartModel modelWithName:@"05-6" value:0.4];
    ChartModel*m7=[ChartModel modelWithName:@"05-7" value:0.7];
    NSArray* chartModelArr=@[m1,m2,m3,m4,m5,m6,m7];
    
    self.chartModelArr=chartModelArr;
    
    ProductChartView*pv= [ProductChartView  ChartView];
    
    pv.chartModelArr=self.chartModelArr;
    
    pv.frame=CGRectMake(0, 0, kUIScreenWidth, 270);

    
    [self.cv addSubview:pv];

    self.pCView=pv;
}

- (void)btnClick {

    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)typeChange:(id)sender {
   
        ChartModel*m1=[ChartModel modelWithName:@"05-1" value: arc4random()%10];
        ChartModel*m2=[ChartModel modelWithName:@"05-2" value: arc4random()%10];
        ChartModel*m3=[ChartModel modelWithName:@"05-3" value: arc4random()%10];
        ChartModel*m4=[ChartModel modelWithName:@"05-4" value: arc4random()%10];
        ChartModel*m5=[ChartModel modelWithName:@"05-5" value: arc4random()%10];
        ChartModel*m6=[ChartModel modelWithName:@"05-6" value: arc4random()%10];
        ChartModel*m7=[ChartModel modelWithName:@"05-7" value: arc4random()%10];
        NSArray* chartModelArr=@[m1,m2,m3,m4,m5,m6,m7];
    
        self.chartModelArr=chartModelArr;
        self.pCView.chartModelArr=self.chartModelArr;
    
}

@end