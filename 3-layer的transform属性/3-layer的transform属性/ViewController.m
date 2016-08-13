//
//  ViewController.m
//  3-layer的transform属性
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
    layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"icon"].CGImage);
    [self.view.layer addSublayer:layer];
    //透明度
    layer.opacity=1;
    self.layer=layer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //旋转
    self.layer.transform=CATransform3DRotate(self.layer.transform, M_PI_4, 0, 0, 1);//x,y,z,z=1表示绕z轴旋转,每次转90度,z轴是垂直于屏幕面的轴，指向脸
    //self.layer.transform=CATransform3DMakeRotation(M_PI_4, 0, 0, 1);//makeRatation表示转到某个角度
    //缩放
    self.layer.transform=CATransform3DScale(self.layer.transform, 0.5, 1, 1);//x=0.5,y=1,z=1表示x轴缩小，y、z不变
    //平移
    self.layer.transform=CATransform3DTranslate(self.layer.transform, 10, 0, 0);//x方向平移
    //获取触摸对象
    UITouch *touch=touches.anyObject;
    CGPoint p=[touch locationInView:touch.view];
    //设置红色的layer跑到手指的位置上
    self.layer.position=p;//position和bounds属性都是可动画属性
    
}




@end
