//
//  RootViewController.h
//  Twatch
//
//  Created by 龚涛 on 10/10/13.
//  Copyright (c) 2013 龚涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

/// TableView for found peripherals
@property (strong, nonatomic) IBOutlet UITableView *peripheralsTableView;

@property (nonatomic, strong) UIButton *scanButton;

@end