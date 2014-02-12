//
//  PMGeocoder.h
//  PinjaFinalTest
//
//  Created by Bruno Bulić on 12/02/14.
//  Copyright (c) 2014 Pinjamar. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@class PMGeocoderData;

typedef void(^PMGeocoderDataResponse)(NSString * address, NSError *error);

@interface PMGeocoder : AFHTTPRequestOperationManager

+ (void)setGeocoderUsername:(NSString *)user andPassword:(NSString *)password;

+ (void)reverseGeocodeData:(PMGeocoderData *)data withResponse:(PMGeocoderDataResponse)response;

@end


@interface PMGeocoderData : NSObject

@property (nonatomic, assign) CGFloat latitude;
@property (nonatomic, assign) CGFloat longitude;

@end
