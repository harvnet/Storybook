//
//  Page2Controller.m
//  Assignment3
//
//  Created by Paul Harvey on 2016-03-16.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import "Page2Controller.h"
#import "Page3Controller.h"

@interface Page2Controller ()

@property (weak, nonatomic) IBOutlet UITextView *view2textView;

@property (weak, nonatomic) IBOutlet UINavigationItem *pageBTitle;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonA;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonB;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end



@implementation Page2Controller


-(void)viewDidLoad{
    
    _view2textView.text = _currentPage.pageText;
    _pageBTitle.title = [NSString stringWithFormat:@"Page %d", _currentPage.pageNumber];
    
    _buttonA.title = [NSString stringWithFormat:@"Goto %d", _currentPage.pageChoiceA.pageNumber];
    
    _buttonB.title = [NSString stringWithFormat:@"Goto %d", _currentPage.pageChoiceB.pageNumber];

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


- (IBAction)ChoiceA:(id)sender {
    
    [self performSegueWithIdentifier:@"segue2" sender:@"A"];
}

- (IBAction)ChoiceB:(id)sender {
    
    [self performSegueWithIdentifier:@"segue2" sender:@"B"];
}



- (void)prepareForSegue:(UIStoryboardSegue * )segue sender:(id)sender{
    
    if ([sender isEqualToString: @"A"]){
        _currentPage.pageChoiceA.seconds = _currentPage.seconds;
        [[segue destinationViewController] setPage: _currentPage.pageChoiceA];
    }
    if ([sender isEqualToString: @"B"]){
        _currentPage.pageChoiceB.seconds = _currentPage.seconds;
        [[segue destinationViewController] setPage: _currentPage.pageChoiceB];    }
    
}

@end
