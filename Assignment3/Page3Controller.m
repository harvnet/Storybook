//
//  Page3Controller.m
//  Assignment3
//
//  Created by Paul Harvey on 2016-03-16.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import "Page3Controller.h"


@interface Page3Controller ()

@property (weak, nonatomic) IBOutlet UITextView *view3textView;
@property (weak, nonatomic) IBOutlet UINavigationItem *pageCTitle;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;



@end



@implementation Page3Controller


-(void)viewDidLoad{
    
    _view3textView.text = _currentPage.pageText;
    _pageCTitle.title = [NSString stringWithFormat:@"Page %d", _currentPage.pageNumber];
    
}

-(void)viewWillAppear:(BOOL)animated{
    _timeLabel.text = [NSString stringWithFormat:@"Time: %i", _currentPage.seconds];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector (callBackFunction) userInfo:nil repeats:YES];
}


- (void)callBackFunction{
    _currentPage.seconds ++;
    _timeLabel.text = [NSString stringWithFormat:@"Time: %i", _currentPage.seconds];
}

-(void)viewWillDisappear:(BOOL)animated {
    if (_timer != nil)
    {
        [_timer invalidate];
        _timer = nil;
    }
}


-(void) setPage: (Page *) page
{
    _currentPage = page;
    
}

- (IBAction)homeButton:(id)sender {
    
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger bestTime = [userDefaults integerForKey:@"best_time"];
    
    if (_currentPage.seconds < bestTime)
    {
        [userDefaults setInteger:_currentPage.seconds forKey:@"best_time"];
    }
    
    [userDefaults synchronize];
    
    
    _currentPage.pageOne.seconds = 0;
    _currentPage = _currentPage.pageOne;
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
