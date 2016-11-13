//
//  ConnectedBlue.h
//  EasyBLUE
//
//  Created by Lorain on 2016/11/13.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bluetooth.h"
@interface ConnectedBlue : UIViewController
<UITableViewDelegate,UITableViewDataSource,BluetoothDelegate>
@property (retain,nonatomic) UITableView* detailtab;
@property (retain,nonatomic) Bluetooth* blue;
@end
