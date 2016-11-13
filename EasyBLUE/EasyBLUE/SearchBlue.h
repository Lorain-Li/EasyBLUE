//
//  SearchBlue.h
//  EasyBLUE
//
//  Created by Lorain on 2016/11/9.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bluetooth.h"
#import "ConnectedBlue.h"
@interface SearchBlue : UIViewController
<UITableViewDelegate,UITableViewDataSource,BluetoothDelegate>

@property (retain,nonatomic) UITableView    *bluetab;
@property (retain,nonatomic) Bluetooth      *blue;

@end
