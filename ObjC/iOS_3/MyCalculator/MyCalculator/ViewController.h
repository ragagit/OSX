//
//  ViewController.h
//  MyCalculator
//
//  Created by Ramses Garcia on 2017-03-11.
//  Copyright © 2017 raga. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic)IBOutlet UILabel *display;

-(void)processDigit: (int)digit;
-(void)processOp:(char) theOp;
-(void)storeFracPart;

-(IBAction)clickDigit:(UIButton*)sender;

-(IBAction)clickPlus;
-(IBAction)clickMinus;
-(IBAction)clickMultiply;
-(IBAction)clickDevide;
-(IBAction)clickOver;
-(IBAction)clickEquals;
-(IBAction)clickClear;

@end

