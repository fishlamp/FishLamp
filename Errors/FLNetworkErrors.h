//
//  FLNetworkErrors.h
//  FishLampCocoa
//
//  Created by Mike Fullerton on 4/17/13.
//  Copyright (c) 2013 GreenTongue Software LLC, Mike Fullerton. 
//  The FishLamp Framework is released under the MIT License: http://fishlamp.com/license 
//

#import "FishLampCore.h"
#import "NSError+FLNetworking.h"

extern NSString* const FLNetworkErrorDomain;

typedef enum {
    FLNetworkErrorCodeNoRouteToHost = EHOSTUNREACH
} FLNetworkErrorCode;


//	FLAuthenticationErrorPasswordIncorrect,
//	FLAuthenticationErrorPasswordIncorrectOffline,
