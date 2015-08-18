//
//  FlurryAdNative+Private.h
//  Flurry
//
//  Created by Shruthi Ramesh on 4/17/15.
//  Copyright (c) 2015 Flurry Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlurryAdNative.h"
#import "FlurryNativeVideoState.h"


@interface FlurryAdNative (Private)

- (FlurryNativeVideoState*)getVideoState;
- (FlurryNativeVideoPlayer*)getVideoPlayer;
- (NSTimer*)getPlayerTimer;
- (void)setPlayerTimer:(NSTimer*)timer;
- (BOOL)isAutoPlay;
- (BOOL)videoIntergrationCorrectness;
- (NSDate*)adMoveOutTimeStamp;

@end