//
//  360ViewController.m
//  Twatch
//
//  Created by yixiaoluo on 13-10-30.
//  Copyright (c) 2013年 龚涛. All rights reserved.
//

#import "_360ViewController.h"
#import "FVImageSequence.h"

@interface _360ViewController ()

@end

@implementation _360ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    FVImageSequence *imageSquence = [[FVImageSequence alloc] initWithImage:[UIImage imageNamed:@"Seq_v04_640x378_0.jpg"]];
    imageSquence.center = self.view.center;
    imageSquence.userInteractionEnabled = YES;
    [self.view addSubview:imageSquence];
    
    //Set slides extension
	[imageSquence setExtension:@"jpg"];
	
	//Set slide prefix prefix
	[imageSquence setPrefix:@"Seq_v04_640x378_"];
	
	//Set number of slides
	[imageSquence setNumberOfImages:36];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end