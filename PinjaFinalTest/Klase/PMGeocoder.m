//
//  PMGeocoder.m
//  PinjaFinalTest
//
//  Created by Bruno Bulić on 12/02/14.
//  Copyright (c) 2014 Pinjamar. All rights reserved.
//

#import "PMGeocoder.h"

@implementation PMGeocoder

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://jabuka1.dyndns.org:9010"]];
    if(self) {
        [self setRequestSerializer:[AFHTTPRequestSerializer serializer]];
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
    }
    return self;
}

+ (PMGeocoder *)privateImpl {
    static PMGeocoder * _impl;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _impl = [self new];
    });
    
    return _impl;
}

+ (void)reverseGeocodeData:(PMGeocoderData *)data withResponse:(PMGeocoderDataResponse)response {
    PMGeocoder * selfImpl = [self privateImpl];
    
    NSDictionary * d = @{@"lat" : [NSNumber numberWithFloat:data.latitude],
                         @"lon" :[NSNumber numberWithFloat:data.longitude]};
    
    [selfImpl GET:@"/api/geolocation/reverse_geocode" parameters:d success:^(AFHTTPRequestOperation *operation, id responseObject) {
        response([responseObject objectForKey:@"address"], nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        response(nil, error);
    }];
}

@end

@implementation PMGeocoderData


@end
