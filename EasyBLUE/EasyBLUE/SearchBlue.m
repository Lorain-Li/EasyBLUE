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
    
    self.title = @"";
    
    NSInteger _sx = [[UIScreen mainScreen] bounds].size.width;
    NSInteger _sy = [[UIScreen mainScreen] bounds].size.height;
    
    _manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    _bletabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _sx, _sy) style:UITableViewStyleGrouped];
    _bletabview.delegate = self;
    _bletabview.dataSource = self;
}

- (void) centralManagerDidUpdateState:(CBCentralManager *)central
{
    if (central.state == CBCentralManagerStatePoweredOn) {
        self.title = @"蓝牙已打开";
    }
    else
    {
        self.title = @"蓝牙未就绪";
        NSLog(@"bluetooth state:%ld",central.state);
    }
}




- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _blelist.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* _cell = [_bletabview dequeueReusableCellWithIdentifier:@"TT"];
    if (_cell == nil) {
        _cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TT"];
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
