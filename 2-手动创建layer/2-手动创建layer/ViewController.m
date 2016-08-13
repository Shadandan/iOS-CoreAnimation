//
//  ViewController.m
//  2-手动创建layer
//
//  Created by shadandan on 16/8/13.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *layer=[[CALayer alloc]init];
    //设置大小
    layer.bounds=CGRectMake(0,0,100,100);
    //设置位置
    layer.position=CGPointMake(100,100);
    //设置颜色
    layer.backgroundColor=[UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    //透明度
    layer.opacity=1;
    self.layer=layer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取触摸对象
    UITouch *touch=touches.anyObject;
    CGPoint p=[touch locationInView:touch.view];
    //设置红色的layer跑到手指的位置上
    self.layer.position=p;//position和bounds属性都是可动画属性
    
    //禁用隐式动画
    [CATransaction begin];//1.开启事务
    [CATransaction setDisableActions:YES];//2.禁用隐式动画
    self.layer.bounds=CGRectMake(0, 0, 200, 200);//3.要禁用动画的语句
    [CATransaction commit];//4.提交事务
}

@end
