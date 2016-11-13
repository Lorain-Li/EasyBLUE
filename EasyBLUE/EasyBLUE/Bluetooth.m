//
//  Bluetooth.m
//  EasyBLUE
//
//  Created by Lorain on 2016/11/10.
//  Copyright © 2016年 LorainLynies. All rights reserved.
//

#import "Bluetooth.h"

@implementation Bluetooth

- (instancetype) initWithDelegate:(id<BluetoothDelegate>)delegate
{
    self = [super init];
    self.delegate = delegate;
    self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    self.bluelist = [[NSMutableArray alloc] init];
    self.advlist = [[NSMutableArray alloc] init];
    return self;
}

- (void) startScan
{
    [self.manager scanForPeripheralsWithServices:nil options:nil];
}

- (void) stopScan
{
    [self.manager stopScan];
}

- (void) clearnlist
{
    self.bluelist = [[NSMutableArray alloc] init];
    self.advlist = [[NSMutableArray alloc] init];
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    if (central.state == CBCentralManagerStatePoweredOn) {
        [self.delegate bluetoothIsReady];
    }
    else
    {
        NSLog(@"CBCentralManagerStatePower error!");
    }
}


- (void) centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI
{
    BOOL norepeat = TRUE;
    for (NSInteger i = 0; i < self.bluelist.count; i++) {
        CBPeripheral* tmpblue = [self.bluelist objectAtIndex:i];
        if (peripheral.identifier == tmpblue.identifier) {
            norepeat = FALSE;
            break;
        }
    }
    if (norepeat) {
        [self.bluelist addObject:peripheral];
        [self.advlist addObject:advertisementData];
        [self.delegate didDiscoverNewPeripheral:peripheral];
    }
}

-(void)connectToPeripheral:(CBPeripheral *)peripheral
{
    [_manager connectPeripheral:peripheral options:nil];
}


-(void) centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    
}

-(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    NSLog(@"%@",peripheral.services);
}

@end
