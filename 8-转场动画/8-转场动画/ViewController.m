//
//  ViewController.m
//  8-转场动画
//
//  Created by shadandan on 16/8/13.
//  Copyright © 2016年 SDD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,assign)int imageId;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageId=1;
}
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    self.imageId++;
    if (self.imageId==8) {
        self.imageId=1;
    }
    self.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d",self.imageId]];
    [self changeImage:sender];
    NSLog(@"right");
}
- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender {
    self.imageId--;
    if (self.imageId==0) {
        self.imageId=7;
    }
    self.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d",self.imageId]];
    [self changeImage:sender];
    NSLog(@"left");
}
//转场动画
-(void)changeImage:(UISwipeGestureRecognizer *)sender{
    
    CATransition *anim=[[CATransition alloc]init];
    anim.type=@"cube";
    //判断方向
    if (sender.direction==UISwipeGestureRecognizerDirectionRight) {
        anim.subtype=kCATransitionFromLeft;
    }
    else{
        anim.subtype=kCATransitionFromRight;

    }
    [self.imageView.layer addAnimation:anim forKey:nil];
}

@end
