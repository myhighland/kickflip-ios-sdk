//
//  KFUser.m
//  FFmpegEncoder
//
//  Created by Christopher Ballinger on 1/22/14.
//  Copyright (c) 2014 Christopher Ballinger. All rights reserved.
//

#import "KFUser.h"
#import "KFLog.h"

static NSString * const KFUserActiveUserKey = @"KFUserActiveUserKey";

@interface KFUser()
@property (readwrite, nonatomic, strong) NSString *username;
@property (readwrite, nonatomic, strong) NSString *uuid;
@property (readwrite, nonatomic, strong) NSString *appName;
@end

@implementation KFUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             NSStringFromSelector(@selector(username)): @"name",
             NSStringFromSelector(@selector(uuid)): @"uuid",
             NSStringFromSelector(@selector(appName)): @"app"
             };
}

+ (instancetype) activeUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedData = [defaults objectForKey:KFUserActiveUserKey];
    if (!encodedData) {
        return nil;
    }
    KFUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:encodedData];
    return user;
}

+ (void) setActiveUser:(KFUser*)user {
    [self deactivateUser];
    if (!user) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    [defaults setObject:encodedObject forKey:KFUserActiveUserKey];
    [defaults synchronize];
}


+ (void) deactivateUser {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:KFUserActiveUserKey];
    [defaults synchronize];
}

@end
