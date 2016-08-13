//
//  ViewController.m
//  6-关键帧动画
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
    UIView *redView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    self.layer=redView.layer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CAKeyframeAnimation *anim=[[CAKeyframeAnimation alloc]init];
    //anim.keyPath=@"position";
    anim.keyPath=@"transform.rotation.z";
    //画z字形路径
//    NSValue *v1=[NSValue valueWithCGPoint:CGPointMake(50, 50)];
//    NSValue *v2=[NSValue valueWithCGPoint:CGPointMake(150, 50)];
//    NSValue *v3=[NSValue valueWithCGPoint:CGPointMake(50, 150)];
//    NSValue *v4=[NSValue valueWithCGPoint:CGPointMake(150, 150)];
//    anim.values=@[v1,v2,v3,v4];//放关键的位置
    
    //仿删除程序的抖动效果
    NSValue *v1=[NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, 0-M_PI_2*0.2-M_PI_2, 0, 0, 1)];//注意x轴正方向是0度，往上是负角度，往下是正角度
    NSValue *v2=[NSValue valueWithCATransform3D:CATransform3DRotate(self.layer.transform, M_PI_2*0.2-M_PI_2, 0, 0, 1)];
    anim.values=@[v1,v2,v1];
    
    //画一个圆形路径，沿着路径运动
    //创建一个圆的路径
    //UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:80 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    //anim.path=path.CGPath;
    
    anim.duration=0.2;//设置5秒钟执行完动画
    anim.repeatCount=INT_MAX;//设置重复次数,
    [self.layer addAnimation:anim forKey:nil];
}

@end
