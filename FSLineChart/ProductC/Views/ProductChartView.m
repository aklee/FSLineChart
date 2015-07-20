//
//  ProductChartView.m
//  JiuCai
//
//  Created by ak on 15/7/18.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import "ProductChartView.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"


#define BlueColor  CORLOC(116,202,226,1)
#define SelectCircleColor CORLOC(1,172,219,1)

@implementation ChartModel
+(instancetype)modelWithName:(NSString*)name value:(float)value{
    ChartModel*m=[[ChartModel alloc]init];
    m.name=name;
    m.value=value;
    return m;
}
@end


@interface ProductChartView()

@property(nonatomic,strong)FSLineChart* lineChart ;
@property (weak, nonatomic) IBOutlet UIView *chartV;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;

// 七日年华收益
@property (weak, nonatomic) IBOutlet UILabel *incomePercentLb;

@property (weak, nonatomic) IBOutlet UILabel *incomeWLb;


@end


@implementation ProductChartView


+(ProductChartView*)ChartView{
    ProductChartView*cv=(ProductChartView*)[[[UINib nibWithNibName:@"ProductChartView" bundle:nil]instantiateWithOwner:nil options:nil  ]firstObject ];
    return cv;
}
-(void)awakeFromNib{
     [self setup];

    //self.layer.borderColor=[UIColor blackColor].CGColor;
    //self.layer.borderWidth=1;
}
-(void)setup{
    
//    ChartModel*m1=[ChartModel modelWithName:@"05-1" value:0.1];
//    ChartModel*m2=[ChartModel modelWithName:@"05-2" value:0.5];
//    ChartModel*m3=[ChartModel modelWithName:@"05-3" value:0.12];
//    ChartModel*m4=[ChartModel modelWithName:@"05-4" value:0.4];
//    ChartModel*m5=[ChartModel modelWithName:@"05-5" value:0.1];
//    ChartModel*m6=[ChartModel modelWithName:@"05-6" value:0.4];
//    ChartModel*m7=[ChartModel modelWithName:@"05-17" value:0.7];
//    NSArray* chartModelArr=@[m1,m2,m3,m4,m5,m6,m7];
//    
//    self.chartModelArr=chartModelArr;
  

     
}
-(void)setChartModelArr:(NSArray *)chartModelArr{
    _chartModelArr=chartModelArr;

    if (self.lineChart) {
    [self.lineChart removeFromSuperview];
    }
    [self.chartV addSubview:[self chart]];
}

#pragma mark 统计图绘制

-(FSLineChart*)chart {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:self.chartModelArr.count];
    for(int i=0;i<self.chartModelArr.count;i++) {
        ChartModel*m=self.chartModelArr[i];
        chartData[i] = [NSNumber numberWithFloat:m.value];
    }
    
    
    // Creating the line chart
    FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(30, 0, kUIScreenWidth-50,270-40)];
    lineChart.verticalGridStep = 6;
    lineChart.horizontalGridStep = 7;
    lineChart.color = BlueColor;
    lineChart.fillColor = [lineChart.color colorWithAlphaComponent:0.3];
    lineChart.backgroundColor=[UIColor groupTableViewBackgroundColor];
    lineChart.valueLabelBackgroundColor=[UIColor clearColor];
    
    lineChart.labelForIndex = ^(NSUInteger item) {
        
        ChartModel*m= self.chartModelArr[item];
        
        return m.name;
    };
    
    lineChart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.02f", value];
    };
    lineChart.lineWidth=1;
    
    lineChart.dataPointRadius=3;
    lineChart.displayDataPoint=YES;
    lineChart.dataPointBackgroundColor=[UIColor whiteColor];
    lineChart.dataPointColor=BlueColor;
    
    //    x y轴
    lineChart.axisLineWidth=1;
    lineChart.axisColor=BlueColor;//[UIColor clearColor];
    
    
    //光滑设置
    //    lineChart.bezierSmoothing=NO;
    
    //    y坐标 位置
    lineChart.valueLabelPosition=ValueLabelLeft;
    
    lineChart.innerGridLineWidth=1;
    
    
    [lineChart setChartData:chartData];
    
    
    lineChart .selectCircleColor=SelectCircleColor;
    
    
    lineChart.chartClick=^(int index){
      
//       ChartModel *curM= (ChartModel *)self.chartModelArr[index];
     
        self.dateLb.text=@"11月11日";
        
        self.incomePercentLb.text=@"11.1%";
        
        
        self.incomeWLb.text=[NSString stringWithFormat:@"0.%u元",arc4random()%10000];
    };
    
    self.lineChart=lineChart;
    
    
    //    lineChart.layer.borderColor=[UIColor blackColor].CGColor;
    //    lineChart.layer.borderWidth=1;
    return lineChart;
}


//todo:kvo数组变化 更新图形
@end
