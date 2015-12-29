//
//  ViewController.m
//  TaxCalculator
//
//  Created by Nicholas Naudé on 27/12/2015.
//  Copyright © 2015 Nicholas Naudé. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *onCalculateButtonTapped;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property double caTax;
@property double chiTax;
@property double nyTax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _segmentedControl.layer.cornerRadius = 4;
    _segmentedControl.clipsToBounds = YES;
    self.caTax = .075;
    self.chiTax = .0925;
    self.nyTax = .045;
    
}

- (IBAction)calculateButtonTapped:(id)sender {
    NSString *priceEntered = self.priceTextField.text;
    double priceValue = priceEntered.intValue;
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        double result = priceValue * self.caTax;
        self.resultLabel.hidden = false;
        [[self.priceTextField superview] endEditing:YES];
        self.resultLabel.text = [NSString stringWithFormat:@"California sales tax is $%.2f", result];
    } else if (self.segmentedControl.selectedSegmentIndex == 1) {
        double result = priceValue * self.chiTax;
        self.resultLabel.hidden = false;
        [[self.priceTextField superview] endEditing:YES];
        self.resultLabel.text = [NSString stringWithFormat:@"Chicago sales tax is $%.2f",result];
    } else if (self.segmentedControl.selectedSegmentIndex == 2) {
        double result = priceValue * self.nyTax;
        self.resultLabel.hidden = false;
        [[self.priceTextField superview] endEditing:YES];
        self.resultLabel.text = [NSString stringWithFormat:@"New York sales tax is $%.2f", result];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
