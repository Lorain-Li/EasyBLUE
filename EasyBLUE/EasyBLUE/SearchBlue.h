//
//  SearchBlue.h
//  EasyBLUE
//
//  Created by Lorain on 2016/11/9.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
@interface SearchBlue : UIViewController
<UITableViewDelegate,UITableViewDataSource,CBCentralManagerDelegate,CBPeripheralDelegate>
{
    NSMutableArray*     _blelist;
    CBCentralManager*   _manager;
    CBPeripheral*       _peripheral;
    UITableView*        _bletabview;
}
@end
