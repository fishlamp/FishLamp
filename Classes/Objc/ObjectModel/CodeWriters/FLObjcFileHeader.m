//
//  FLObjcFileHeader.m
//  CodeGenerator
//
//  Created by Mike Fullerton on 5/11/13.
//  Copyright (c) 2013 Mike Fullerton. All rights reserved.
//

#import "FLObjcFileHeader.h"
#import "NSBundle+FLVersion.h"
#import "FLCodeGeneratorOptions.h"
#import "FLCodeCompany.h"
#import "FLCodeProject.h"
#import "FLObjcCodeBuilder.h"
#import "FLObjcFile.h"
#import "FLCodeProjectInfo.h"

@interface FLObjcFileHeader ()
@property (readwrite, strong, nonatomic) FLCodeProject* codeProject;
@end

@implementation FLObjcFileHeader

@synthesize codeProject = _codeProject;

+ (id) objcFileHeader:(FLObjcProject*) project {
    return FLAutorelease([[[self class] alloc] initWithProject:project]);
}

#if FL_MRC
- (void) dealloc {
    [_codeProject release];
    [super dealloc];
}
#endif

- (void) configureWithInputProject:(FLCodeProject*) codeProject {
    self.codeProject = codeProject;
}

- (void) appendWarningComment:(FLObjcComment*) comment {

}

- (void) writeCodeToFile:(FLObjcFile*) file withCodeBuilder:(FLObjcCodeBuilder*) codeBuilder {


    NSDateFormatter *dateFormatter = FLAutorelease([[NSDateFormatter alloc] init]);
    [dateFormatter setDateStyle:kCFDateFormatterShortStyle];
    [dateFormatter setTimeStyle:kCFDateFormatterShortStyle];

    NSString *formattedDateString = [dateFormatter stringFromDate:[NSDate date]];

    FLObjcComment* comment = [FLObjcComment objcComment];
    [comment appendEmptyComment];
	[comment appendLineWithFormat:@"%@", file.fileName];
    [comment appendEmptyComment];
    [self appendWarningComment:comment];
	[comment appendLineWithFormat:@"Generated by: %@ @ %@ with %@ (%@)", NSFullUserName(), formattedDateString, [NSBundle bundleName], [NSBundle bundleVersion]];
    [comment appendEmptyComment];
	if(FLStringIsNotEmpty(self.codeProject.info.projectName)) {
        [comment appendLineWithFormat:@"Project: %@", self.codeProject.info.projectName];
    }
	if(FLStringIsNotEmpty(self.codeProject.info.schemaName)) {
        [comment appendLineWithFormat:@"Schema: %@", self.codeProject.info.schemaName];
    }
    FLCodeCompany* company = self.codeProject.info.organization;
    
    if(company) {
        if(FLStringIsNotEmpty(company.name)) {
            [comment appendEmptyComment];
            
            if(FLStringIsNotEmpty(company.website)) {
                [comment appendLineWithFormat:@"Organization: %@ (%@)", company.name, company.website];
            }
            NSDateComponents *components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
            [comment appendLineWithFormat:@"Copyright %ld (c) %@", (long) components.year, company.name];
        }
        
    }

    if(FLStringIsNotEmpty(self.codeProject.info.license)) {
        [comment appendLine:self.codeProject.info.license];
    }
    [comment appendEmptyComment];
    
    [codeBuilder appendString:comment];
    
	if(self.codeProject.options.disabled) {
        [codeBuilder appendBlankLine];
        [codeBuilder appendPreprocessorIf:@"DISABLED"];
        [codeBuilder appendBlankLine];
	} 
    [codeBuilder appendBlankLine];
	
}

- (void) writeCodeToHeaderFile:(FLObjcFile*) file withCodeBuilder:(FLObjcCodeBuilder*) codeBuilder {
    [self writeCodeToFile:file withCodeBuilder:codeBuilder];
}

- (void) writeCodeToSourceFile:(FLObjcFile*) file withCodeBuilder:(FLObjcCodeBuilder*) codeBuilder {
    [self writeCodeToFile:file withCodeBuilder:codeBuilder];
}

@end

@implementation FLObjcGeneratedFileHeader

- (void) appendWarningComment:(FLObjcComment*) comment {
    [comment appendLine:@"DO NOT MODIFY!! Modifications will be overwritten."];
}

+ (id) objcGeneratedFileHeader {
    return FLAutorelease([[[self class] alloc] init]);
}
@end

@implementation FLObjcUserFileHeader

- (void) appendWarningComment:(FLObjcComment*) comment {
    [comment appendLine:@"Modifications are expected. File will not be overwritten."];
}

+ (id) objcUserFileHeader {
    return FLAutorelease([[[self class] alloc] init]);
}
@end