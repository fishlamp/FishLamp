// 
// FLCodeGeneratorOptionsBaseClass.h
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

@class FLCodeDefine;

@interface FLCodeGeneratorOptionsBaseClass : FLModelObject {
@private
    NSString* _userObjectsFolderName;
    NSString* _allIncludesFileName;
    NSString* _typePrefix;
    BOOL _generateUserObjects;
    FLCodeDefine* _globalDefine;
    BOOL _canLazyCreate;
    NSString* _comment;
    BOOL _disabled;
    NSString* _objectsFolderName;
}

@property (readwrite, strong, nonatomic) NSString* allIncludesFileName;
@property (readwrite, assign, nonatomic) BOOL canLazyCreate;
@property (readwrite, strong, nonatomic) NSString* comment;
@property (readwrite, assign, nonatomic) BOOL disabled;
@property (readwrite, assign, nonatomic) BOOL generateUserObjects;
@property (readwrite, strong, nonatomic) FLCodeDefine* globalDefine;
@property (readwrite, strong, nonatomic) NSString* objectsFolderName;
@property (readwrite, strong, nonatomic) NSString* typePrefix;
@property (readwrite, strong, nonatomic) NSString* userObjectsFolderName;

+ (id) codeGeneratorOptions;

@end
