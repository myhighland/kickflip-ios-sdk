//
//  Kickflip.m
//  FFmpegEncoder
//
//  Created by Christopher Ballinger on 1/16/14.
//  Copyright (c) 2014 Christopher Ballinger. All rights reserved.
//

#import "Kickflip.h"
#import "KFBroadcastViewController.h"

static NSString *_apiKey;
static NSString *_apiSecret;

@implementation Kickflip

+ (void) presentBroadcasterFromViewController:(UIViewController *)viewController ready:(void (^)(NSURL *, NSError *))readyBlock completion:(void (^)(void))completionBlock {
    KFBroadcastViewController *broadcastViewController = [[KFBroadcastViewController alloc] init];
    [viewController presentViewController:broadcastViewController animated:YES completion:nil];
}

+ (void) initialize {
    _apiKey = nil;
    _apiSecret = nil;
}

+ (void) setupWithAPIKey:(NSString *)key secret:(NSString *)secret {
    _apiKey = [key copy];
    _apiSecret = [secret copy];
}

+ (NSString*) apiKey {
    return _apiKey;
}

+ (NSString*) apiSecret {
    return _apiSecret;
}

@end
