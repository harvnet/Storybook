//
//  Page.h
//  Assignment3
//
//  Created by Paul Harvey on 2016-03-10.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Page : NSObject

@property int pageNumber;
@property NSString * pageText;
@property Page * pageChoiceA;
@property Page * pageChoiceB;
@property Page * pageOne;

@property int seconds;

@end
