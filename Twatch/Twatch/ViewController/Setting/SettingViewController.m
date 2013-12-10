//
//  MoreSettingViewController.m
//  T-Fire2.0
//
//  Created by yixiaoluo on 13-11-28.
//  Copyright (c) 2013年 tomoon. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingCell.h"
#import "AppCenterViewController.h"

#define SWITCH_TIMEADJUST_TAG  1001
#define SWITCH_DISCOVERYWATCH_TAG  1002
#define SWITCH_PUSHSETTING_TAG  1003
#define SWITCH_CONNECTTESTING_TAG  1004

@implementation MoreSettingCell

-(void) layoutSubviews
{
    [super layoutSubviews];
    [self.imageView setFrame:CGRectMake(20, 15,20, 20)];
    
    [self.textLabel setFrame:CGRectMake(50, 10, 200, 30)];
}

@end

@interface SettingViewController ()
@property(nonatomic,strong)NSArray *subviewControllerArray;
@property(nonatomic,strong)NSArray *titleArray;
@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleArray = [NSArray arrayWithObjects:@"设置",@"二维码管理",@"账号绑定", nil];
    self.subviewControllerArray = [NSArray arrayWithObjects:@"MoreSettingViewController",
                                   @"QRCodeManagerViewController",
                                   @"AGAuthViewController",
                                   nil];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, IS_IOS7 ? 65 :45
                                                                           , CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 50;
    tableView.scrollEnabled = NO;
    tableView.backgroundColor = [UIColor colorWithHex:@"F2F7FD"];
    tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:tableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"SettingCell";
    MoreSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell != nil) {
    }
    if (!cell)
    {
        cell = [[MoreSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = [UIColor colorWithHex:@"333333"];
    
    switch (indexPath.row)
    {
        case 0:
        {
            cell.textLabel.text = @"时间校对";
            cell.imageView.image = [UIImage imageNamed:@"时间"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            //            UISwitch *switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(250, 10, 50.5, 10)];
            //            switchBtn.tag = SWITCH_TIMEADJUST_TAG;
            //            [switchBtn addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventTouchUpInside];
            //            [cell addSubview:switchBtn];
//            ToggleView *toggleViewBaseChange = [[ToggleView alloc]initWithFrame:CGRectMake(250, 13, 51, 24) toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeChangeImage toggleButtonType:ToggleButtonTypeDefault];
//            toggleViewBaseChange.tag = SWITCH_TIMEADJUST_TAG;
//            toggleViewBaseChange.toggleDelegate = self;
//            [cell addSubview:toggleViewBaseChange];
            
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"查找手表";
            cell.imageView.image = [UIImage imageNamed:@"setting_Watch"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"推送开关";
            cell.imageView.image = [UIImage imageNamed:@"推送"];
//            UISwitch *switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(250, 10, 50.5, 10)];
//            switchBtn.tag = SWITCH_PUSHSETTING_TAG;
//            [switchBtn addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventTouchUpInside];
//            [cell addSubview:switchBtn];
            
            ToggleView *toggleViewBaseChange = [[ToggleView alloc]initWithFrame:CGRectMake(250, 13, 51, 24) toggleViewType:ToggleViewTypeNoLabel toggleBaseType:ToggleBaseTypeChangeImage toggleButtonType:ToggleButtonTypeDefault];
            toggleViewBaseChange.tag = SWITCH_PUSHSETTING_TAG;
            toggleViewBaseChange.toggleDelegate = self;
            [cell addSubview:toggleViewBaseChange];
            
        }
            break;
        case 3:
        {
            cell.textLabel.text = @"测试通信";
            cell.imageView.image = [UIImage imageNamed:@"通信"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
            break;
        case 4:
            cell.textLabel.text = @"设置";
            cell.imageView.image = [UIImage imageNamed:@"setting_Setting"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 5:
            cell.textLabel.text = @"二维码管理";
            cell.imageView.image = [UIImage imageNamed:@"二维码"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 6:
            cell.textLabel.text = @"账号绑定";
            cell.imageView.image = [UIImage imageNamed:@"账号"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;

        default:
            break;
    }
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, tableView.rowHeight - .5, CGRectGetWidth(tableView.frame) , .5)];
    line.backgroundColor = [UIColor colorWithHex:@"cfe1f5"];
    [cell addSubview:line];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            BlockUIAlertView *alertView = [[BlockUIAlertView alloc] initWithTitle:@"" message:@"是否确认进行时间校对?" cancelButtonTitle:@"是"  otherButtonTitles:[NSString stringWithFormat:@"否",nil] buttonBlock:^(NSInteger indexButton){
                NSLog(@"%d",indexButton);
            }];
            [alertView show];
        }
            break;
        case 1:
            break;
        case 2:
            //test
            break;
        case 3:
            [[ViewUtils rootViewController] sendDataToBle:@"hello, this is an iPhone" transerType:kTransferDataType_String];
            break;
            
        default:
        {
            NSString *className = self.subviewControllerArray[indexPath.row - 4];
            UIViewController *aController = [[NSClassFromString(className) alloc] initWithNibName:nil bundle:nil];
            ((NaviCommonViewController*)aController).backName = self.titleArray[indexPath.row - 4];
            [self.navigationController pushViewController:aController animated:YES];
        }
            break;
    }
    
}

#pragma mark - ToggleViewDelegate

- (void)selectLeftButton :(id)sender
{
    UIView *view = (UIView *)sender;
    if (view.tag == SWITCH_TIMEADJUST_TAG)
    {
    }
    else if(view.tag == SWITCH_DISCOVERYWATCH_TAG)
    {
    }
    else if (view.tag == SWITCH_CONNECTTESTING_TAG)
    {
    }
    NSLog(@"LeftButton Selected");
}

- (void)selectRightButton :(id)sender
{
    ToggleView *view = (ToggleView *)sender;
    if (view.tag == SWITCH_TIMEADJUST_TAG)
    {
        __weak typeof(ToggleView*) welkView = view;
        BlockUIAlertView *alertView = [[BlockUIAlertView alloc] initWithTitle:@"" message:@"是否确认进行时间校对?" cancelButtonTitle:@"是"  otherButtonTitles:[NSString stringWithFormat:@"否",nil] buttonBlock:^(NSInteger indexButton){
            NSLog(@"%d",indexButton);
            if (indexButton == 1)
            {
                welkView.selectedButton = ToggleButtonSelectedLeft;
            }
        }];
        [alertView show];
    }
    else if(view.tag == SWITCH_DISCOVERYWATCH_TAG)
    {
    }
    else if (view.tag == SWITCH_CONNECTTESTING_TAG)
    {
    }
    else
    {}
    NSLog(@"RightButton Selected");
}

//-(void)switchClick: (id)sender
//{
//    UISwitch *switchBtn = (UISwitch *)sender;
//    if (switchBtn.tag == SWITCH_TIMEADJUST_TAG) {
//        ;
//    }
//    else if (switchBtn.tag == SWITCH_DISCOVERYWATCH_TAG)
//    {
//        ;
//    }
//    else if (switchBtn.tag == SWITCH_PUSHSETTING_TAG)
//    {
//        ;
//    }
//    else if (switchBtn.tag == SWITCH_CONNECTTESTING_TAG)
//    {
//        ;
//    }
//}
@end
