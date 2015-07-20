//
//  ProductChartView.h
//  JiuCai
//
//  Created by ak on 15/7/18.
//  Copyright (c) 2015年 hundsun. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ChartModel:NSObject
//@property(nonatomic,copy)NSString*date;
@property(nonatomic,copy)NSString*incomePercent;
@property(nonatomic,copy)NSString*incomeMoney;
//x轴参数
@property(nonatomic,copy)NSString* name;
//y轴参数
@property(nonatomic,assign)float value;
+(instancetype)modelWithName:(NSString*)name value:(float)value;
@end



@interface ProductChartView : UIView
//修改数组即重新绘制图形  ChartModel 集合
@property(nonatomic,copy)NSArray* chartModelArr ;
+(ProductChartView*)ChartView;
@end





