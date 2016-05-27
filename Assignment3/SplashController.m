//
//  SplashController.m
//  Assignment3
//
//  Created by Paul Harvey on 2016-04-06.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import "SplashController.h"

@interface SplashController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation SplashController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    if ([userDefaults objectForKey:@"best_time"] == nil)
    {
        [userDefaults setInteger:600 forKey:@"best_time"];
        
        [userDefaults synchronize];
    }
    
    _textLabel.text = [NSString stringWithFormat:@"Fastest Time: %li",(long)[userDefaults integerForKey:@"best_time"]];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector (callBackFunction) userInfo:nil repeats:NO];
}

-(void) callBackFunction {
    [_timer invalidate];
    _timer = nil;
    [self performSegueWithIdentifier:@"splashSegue" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
