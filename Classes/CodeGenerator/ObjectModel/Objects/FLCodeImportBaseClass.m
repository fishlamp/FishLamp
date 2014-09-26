// 
// FLCodeImportBaseClass.m
// 
// DO NOT MODIFY!! Modifications will be overwritten.
// Generated by: Mike Fullerton @ 6/27/13 5:17 PM with PackMule (3.0.0.31)
// 
// Project: FishLamp Code Generator
// 
// Copyright 2013 (c) GreenTongue Software LLC, Mike Fullerton
// The FishLamp Framework is released under the MIT License: http://fishlamp.com/license
// 

#import "FLModelObject.h"
#import "FLCodeImportBaseClass.h"

@implementation FLCodeImportBaseClass

+ (id) codeImport {
    return FLAutorelease([[[self class] alloc] init]);
}
#if FL_MRC
- (void) dealloc {
    [_path release];
    [_type release];
    [super dealloc];
}
#endif
@synthesize path = _path;
@synthesize type = _type;
- (FLCodeInputType) typeEnum {
    return FLCodeInputTypeEnumFromString(self.type);
}
- (void) setTypeEnum:(FLCodeInputType) value {
    self.type = FLCodeInputTypeStringFromEnum(value);
}
- (FLCodeInputTypeEnumSet*) typeEnumSet {
    return [FLCodeInputTypeEnumSet enumSet:self.type];;
}
- (void) setTypeEnumSet:(FLCodeInputTypeEnumSet*) value {
    self.type = value.concatenatedString;
}

@end