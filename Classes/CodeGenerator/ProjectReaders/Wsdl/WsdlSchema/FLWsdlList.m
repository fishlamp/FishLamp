// 
// FLWsdlList.m
// 
// DO NOT MODIFY!! Modifications will be overwritten.
// Generated by: Mike Fullerton @ 6/5/13 3:45 PM with PackMule (3.0.0.29)
// 
// Project: FishLamp CodeWriter WSDL Interpreter
// Schema: FLWsdlObjects
// 
// Copyright 2013 (c) GreenTongue Software, LLC
// 


#import "FLWsdlList.h"
#import "FLModelObject.h"
#import "FLWsdlSimpleType.h"

@implementation FLWsdlList

#if FL_MRC
- (void) dealloc {
    [_simpleType release];
    [super dealloc];
}
#endif
@synthesize simpleType = _simpleType;
+ (FLWsdlList*) wsdlList {
    return FLAutorelease([[[self class] alloc] init]);
}

@end
