//
//  SearchBlue.m
//  EasyBLUE
//
//  Created by Lorain on 2016/11/9.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import "SearchBlue.h"

@interface SearchBlue ()

@end

@implementation SearchBlue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"蓝牙未就绪";
    
    NSInteger _sx = [[UIScreen mainScreen] bounds].size.width;
    NSInteger _sy = [[UIScreen mainScreen] bounds].size.height;
    
    _ble = [[Bluetooth alloc] initWithDelegate:self];
    _bletabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _sx, _sy) style:UITableViewStyleGrouped];
    _bletabview.delegate = self;
    _bletabview.dataSource = self;
    
    UIBarButtonItem* _startscan = [[UIBarButtonItem alloc] initWithTitle:@"start" style:UIBarButtonItemStylePlain target:self action:@selector(pressedBarButton:)];
    UIBarButtonItem* _stopscan = [[UIBarButtonItem alloc] initWithTitle:@"stop" style:UIBarButtonItemStylePlain target:self action:@selector(pressedBarButton:)];
    [_stopscan setEnabled:FALSE];
    self.navigationItem.leftBarButtonItem = _startscan;
    self.navigationItem.rightBarButtonItem = _stopscan;
    
    [self.view addSubview:_bletabview];
}

- (void)bluetoothIsReady
{
    self.title = @"蓝牙已就绪";
}

- (void)pressedBarButton:(UIBarButtonItem*)btn
{
    [btn setEnabled:FALSE];
    if (btn == self.navigationItem.leftBarButtonItem) {
        [_ble clearnlist];
        [_ble startScan];
        [self.navigationItem.rightBarButtonItem setEnabled:TRUE];
    }
    else
    {
        [_ble stopScan];
        [self.navigationItem.leftBarButtonItem setEnabled:TRUE];
    }
}

-(void)didDiscoverNewPeripheral:(CBPeripheral *)peripheral
{
    [_bletabview reloadData];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _ble.bluelist.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBPeripheral* tmpblue = [_ble.bluelist objectAtIndex:indexPath.row];
    UITableViewCell* _cell = [_bletabview dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@",tmpblue.identifier]];
    if (_cell == nil) {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[NSString stringWithFormat:@"%@",tmpblue.identifier]];
        if (tmpblue.name == nil) {
            _cell.textLabel.text = @"unnamed";
        }
        else
        {
            _cell.textLabel.text = tmpblue.name;
        }
        _cell.detailTextLabel.text = [NSString stringWithFormat:@"ID:%@",tmpblue.identifier];
    }
    return  _cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
