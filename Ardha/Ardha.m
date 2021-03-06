//
//  Ardha.m
//  Ardha
//
//  Created by Bogo Giertler on 6/5/12.
//  Copyright (c) 2012 schnap.ps. All rights reserved.
//

#import "Ardha.h"

@implementation Ardha {
    @private
        __block __strong AUser *_me;
}

#pragma mark - Ardha singleton
+ (Ardha *)sharedArdha
{
    static Ardha *_sharedArdha = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // we specifically init Ardha with a .plist API key since it's a shared instance
        _sharedArdha = [[Ardha alloc] init];
    });
    return _sharedArdha;
}

#pragma mark - Ardha initialization
- (id)init
{
    self = [super init];
    
    if (!self)
        return nil;
    
    // set up the root user assigned to the API key
    [AUser meWithBlock:^(AUser *me) {
        if (me) {
            _me = me;
        }
    }];
    return self;
}

@end
