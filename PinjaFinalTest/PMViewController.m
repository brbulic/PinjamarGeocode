//
//  PMViewController.m
//  PinjaFinalTest
//
//  Created by Bruno Bulić on 12/02/14.
//  Copyright (c) 2014 Pinjamar. All rights reserved.
//

#import "PMViewController.h"
#import "PMGeocoder.h"

@interface PMViewController ()

@end

@implementation PMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
#warning neki podaci umisto ovog nil
    
    [PMGeocoder reverseGeocodeData:nil withResponse:^(NSString *address, NSError *error) {
        
#warning NEKI REZULTAT
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
