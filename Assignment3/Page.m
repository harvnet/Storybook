//
//  Page.m
//  Assignment3
//
//  Created by Paul Harvey on 2016-03-10.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import "Page.h"

@implementation Page

- (id)init
{
    self = [super init];
    if (self) {
        _pageNumber = 0;
        _pageText = @"";
        _pageChoiceA = nil;
        _pageChoiceB = nil;
        _pageOne = nil;
        _seconds = 0;
    }
    return self;
}


@end
