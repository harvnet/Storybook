//
//  Page3Controller.h
//  Assignment3
//
//  Created by Paul Harvey on 2016-03-16.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Page.h"

@interface Page3Controller : UIViewController

@property Page * currentPage;

@property NSTimer * timer;

- (void) callBackFunction;

-(void) setPage: (Page *) page;


@end
