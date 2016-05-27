//
//  ViewController.h
//  Assignment3
//
//  Created by Paul Harvey on 2016-03-10.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Page.h"

@interface ViewController : UIViewController

@property Page * currentPage;

@property NSTimer * timer;

- (void) callBackFunction;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end

