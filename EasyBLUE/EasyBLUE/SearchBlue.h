//
//  SearchBlue.h
//  EasyBLUE
//
//  Created by Lorain on 2016/11/9.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bluetooth.h"
@interface SearchBlue : UIViewController
<UITableViewDelegate,UITableViewDataSource,BluetoothDelegate>
{
    UITableView*        _bletabview;
    Bluetooth*          _ble;
}
@end
