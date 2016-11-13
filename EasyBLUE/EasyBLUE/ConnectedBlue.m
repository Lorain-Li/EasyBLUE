//
//  ConnectedBlue.m
//  EasyBLUE
//
//  Created by Lorain on 2016/11/13.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import "ConnectedBlue.h"

@interface ConnectedBlue ()

@end

@implementation ConnectedBlue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat _sx = [[UIScreen mainScreen] bounds].size.width;
    CGFloat _sy = [[UIScreen mainScreen] bounds].size.height;
    
    self.detailtab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _sx, _sy) style:UITableViewStyleGrouped];
    self.detailtab.delegate = self;
    self.detailtab.dataSource = self;
    
    [self.view addSubview:self.detailtab];
}

- (void)bluetoothIsReady
{
    self.title = @"蓝牙已就绪";
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.blue.primaryService.count + 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBPeripheral* tmpblue = [self.blue.services objectAtIndex:indexPath.row];
    UITableViewCell* _cell = [self.detailtab dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@",tmpblue.identifier]];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",[self.blue.bluelist objectAtIndex:indexPath.row]);
    [self.blue connectToPeripheral:[self.blue.bluelist objectAtIndex:indexPath.row]];
    ConnectedBlue* detail = [[ConnectedBlue alloc] init];
    detail.blue = self.blue;
    [self.navigationController pushViewController:detail animated:TRUE];
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
