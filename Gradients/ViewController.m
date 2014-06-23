//
//  ViewController.m
//  Gradients
//
//  Created by Joshua Bryson on 6/23/14.
//  Copyright (c) 2014 Quickwork Apps LLC. All rights reserved.
//

#import "ViewController.h"
#import "GradientLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1 Add the ImageView and set its image to "Stripe.png"
    
    // 2
    GradientLabel *gradientLabel = [[GradientLabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 100.0f)];
    [gradientLabel setText:@"This Is A Gradient Label"];
    [gradientLabel setTextAlignment:NSTextAlignmentCenter];

    [gradientLabel setTextColor:[UIColor whiteColor]];
    
    [self.view addSubview:gradientLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
