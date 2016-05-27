//
//  ViewController.m
//  Assignment3
//
//  Created by Paul Harvey on 2016-03-10.
//  Copyright © 2016 harv0116@algonquinlive.com. All rights reserved.
//

#import "ViewController.h"
#import "Page2Controller.h"
#import "Page.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *view1textView;
@property (weak, nonatomic) IBOutlet UINavigationItem *pageATitle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonA;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonB;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ViewController

- (IBAction)ChoiceA:(id)sender {
    
    [self performSegueWithIdentifier:@"segue1" sender:@"A"];
}

- (IBAction)ChoiceB:(id)sender {
    
    [self performSegueWithIdentifier:@"segue1" sender:@"B"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (_currentPage == nil) {
        Page * page1 =  [[Page alloc]init];
        Page * page2 =  [[Page alloc]init];
        Page * page3 =  [[Page alloc]init];
        Page * page4 =  [[Page alloc]init];
        Page * page5 =  [[Page alloc]init];
        Page * page6 =  [[Page alloc]init];
        Page * page7 =  [[Page alloc]init];
        
        page1.pageNumber = 1;
        page1.pageText = @"Your phone buzzes relentlessly with Twitter and Facebook feed updates – zombies are flooding the streets of Ottawa!  You grab your backpack.  Is the first thing you look for: \n\nA weapon to defend yourself? (Click Goto 2)\n\nFood and supplies?  Who knows when you'll be able to have another good meal? (Click Goto 3)";
        page2.pageNumber = 2;
        page2.pageText = @"You rush to the basement and find a baseball bat, a chainsaw, and a paintball gun.  You grab the bat, a few snacks, and consider your options.  Do you: \n\nBoard up the house and try wait out the invasion? (Click Goto 4)\n\nRun to the mall?  It kind-of worked in that movie. (Click Goto 5)";
        page3.pageNumber = 3;
        page3.pageText = @"You pack a few sets of clothes, and as much food as your bag can hold.  Looking cautiously outside the window, the streets seem empty.  Do you:\n\nMake a run for the car?  If you make it out of town, you may be able to buy yourself some time.(Click Goto 6)\n\nCall your buddies and set up a rendezvous?  You'll be safer in numbers. (Click Goto 7)";
        page4.pageNumber = 4;
        page4.pageText = @"You tear apart your furniture and board up all of the windows and doors.  Sitting at the top of the stairs, you wait for the inevitable.  Several hours later the doorbell rings.  You cautiously peer outside, and see your friends waiting at the door.  They laugh hysterically as you rip down the barricade.  “Don't you know what day it is?” one asks you.  April 1st. Ah well - at least you're prepared.";
        page5.pageNumber = 5;
        page5.pageText = @"You grab your bag, lock up the house, and run down the street towards the mall.  Off in the distance, you see some lumbering silhouettes.  As you reach the doors, you notice that a few others seem to have had the same idea.  Once inside, the doors are locked, and you claim one of the big showroom beds and a 60” LED TV as your own.  Who knows how long you'll have to wait?";
        page6.pageNumber = 6;
        page6.pageText = @"Your bags are packed, and you get the keys to the car.  You're glad you filled up the tank on your way home from work last night.  After making sure the coast is clear, you lock the door and dash to the car.  Your parents are out of the country – thankfully – which means that the boat should be locked up along the river.  You'll be safe there; everyone knows that zombies can't swim... right?";
        page7.pageNumber = 7;
        page7.pageText = @"You set your Facebook status to “meet up at 45.216867, -75.962180 ”, stopping only briefly to grab a towel, and your toothbrush.  Dashing to the car, you set your GPS to the meeting point.  Several messages come in from your friends: “on the way”, “c u there”, and “brains! lol”. In 20 minutes you'll be out of the city and with your friends... but then what?";
        
        page1.pageOne = page1;
        page2.pageOne = page1;
        page3.pageOne = page1;
        page4.pageOne = page1;
        page5.pageOne = page1;
        page6.pageOne = page1;
        page7.pageOne = page1;
        
        page1.pageChoiceA = page2;
        page1.pageChoiceB = page3;
        page2.pageChoiceA = page4;
        page2.pageChoiceB = page5;
        page3.pageChoiceA = page6;
        page3.pageChoiceB = page7;
        
        _currentPage = page1;
    }
    
    
    _view1textView.text = _currentPage.pageText;
    _pageATitle.title = [NSString stringWithFormat:@"Page %d", _currentPage.pageNumber];
    
    _buttonA.title = [NSString stringWithFormat:@"Goto %d", _currentPage.pageChoiceA.pageNumber];
    
    _buttonB.title = [NSString stringWithFormat:@"Goto %d", _currentPage.pageChoiceB.pageNumber];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
        _timeLabel.text = [NSString stringWithFormat:@"Time: %i", _currentPage.seconds];
    
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector (callBackFunction) userInfo:nil repeats:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    if (_timer != nil)
    {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)callBackFunction{
    _currentPage.seconds ++;
    _timeLabel.text = [NSString stringWithFormat:@"Time: %i", _currentPage.seconds];


}

- (void) awakeFromNib {
    [super awakeFromNib];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    
    UINavigationBar.appearance.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
