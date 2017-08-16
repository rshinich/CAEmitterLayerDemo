//
//  ViewController.m
//  CAEmitterLayerRain
//
//  Created by 张忠瑞 on 2017/8/7.
//  Copyright © 2017年 张忠瑞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic ,strong) CAEmitterCell     *waterCell;
@property (nonatomic ,strong) CAEmitterLayer    *waterLayer;

@property (nonatomic ,strong) UIView            *rainView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpEmitterLayer];
}


- (void)setUpEmitterLayer
{
    self.rainView = [[UIView alloc] init];
    self.rainView.frame = self.view.bounds;
    self.rainView.backgroundColor = [UIColor clearColor];

    
    self.waterCell = [CAEmitterCell emitterCell];
    self.waterCell.birthRate = 5.0;
    self.waterCell.lifetime = 40.0;
    self.waterCell.lifetimeRange = 10;
    self.waterCell.velocity = 30;
    self.waterCell.velocityRange = 10;
    self.waterCell.yAcceleration = 30;
    self.waterCell.emissionRange = 0;
    self.waterCell.scale = 0.1;
    self.waterCell.scaleRange = 0.05;
    self.waterCell.contents = (id)[[UIImage imageNamed:@"Ovalwater"] CGImage];
    
    
    self.waterLayer = [CAEmitterLayer layer];
    self.waterLayer.emitterPosition = CGPointMake(self.view.bounds.size.width/ 2.0, -10);
    self.waterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width, 0.0);
    self.waterLayer.emitterShape = kCAEmitterLayerLine;
    self.waterLayer.emitterMode = kCAEmitterLayerVolume;
    self.waterLayer.velocity = 5;
    self.waterLayer.emitterCells = @[self.waterCell];

    [self.rainView.layer addSublayer:self.waterLayer];
    [self.view addSubview:self.rainView];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
