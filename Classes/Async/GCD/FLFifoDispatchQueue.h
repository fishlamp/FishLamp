//
//  FLFifoDispatchQueue.h
//  FishLamp
//
//  Created by Mike Fullerton on 1/4/14.
//  Copyright (c) 2014 Mike Fullerton. All rights reserved.
//

#import "FLDispatchQueue.h"

@interface FLFifoDispatchQueue : FLDispatchQueue
+ (id) fifoDispatchQueue;
+ (id) fifoDispatchQueue:(NSString*) label;
@end