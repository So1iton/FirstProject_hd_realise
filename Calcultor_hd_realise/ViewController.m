//
//  ViewController.m
//  Calcultor_hd_realise
//
//  Created by Artem Galagura on 27.04.17.
//  Copyright © 2017 Artem Galagura. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *indikatorLabel;
@property (strong, nonatomic) CalculatorModel *model;

@property (assign, nonatomic) BOOL waitNextOperand;

@end

@implementation ViewController

#pragma mark - Load

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [CalculatorModel new];
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)equalButton:(id)sender {
    
    [self loadInfoToIndicatolLabel];
    self.waitNextOperand = YES;
}

- (IBAction)clearButton:(id)sender {
    self.indikatorLabel.text = @"0";
    self.model.operation = nil;
}

- (IBAction)pointButton:(id)sender {
    
    NSString *string = self.indikatorLabel.text;
    NSRange range = [string rangeOfString:@"."];
    NSLog(@"%@", NSStringFromRange(range));
    if(range.location == NSNotFound)
    {
        string = [string stringByAppendingString:@"."];
        //self.model.currentOperand = string.floatValue;
        self.indikatorLabel.text = string;
    }
}


- (IBAction)reverseButton:(id)sender {
 
    self.model.currentOperand = -self.indikatorLabel.text.floatValue;
    [self loadInfoToIndicatolLabel];
}

- (IBAction)numberButton:(UIButton *)sender {
    
    NSString *value = self.indikatorLabel.text;
    if([value isEqualToString:@"0"] || self.waitNextOperand){
        value = @"";
        self.waitNextOperand = NO;
    }
    value = [value stringByAppendingString:sender.titleLabel.text];
        self.indikatorLabel.text = value;
    
}

- (IBAction)operationButton:(UIButton *)sender {
    
    self.model.operation = sender.titleLabel.text;
    self.model.currentOperand = self.indikatorLabel.text.floatValue;
    
    self.waitNextOperand = YES;
}

#pragma mark - HelpMethod

-(void) loadInfoToIndicatolLabel{
    
    CGFloat value = [self.model performOperand:self.indikatorLabel.text.floatValue];
    
    // не работает с определенным значением выводит или без или 4-нуля
    if(value == (int)value){
        self.indikatorLabel.text = [NSString stringWithFormat:@"%.0f", value];
    }
    else
    {
        NSString *strValue = [NSString stringWithFormat:@"%f", value];
        NSArray *strings = [strValue componentsSeparatedByString:@"."];
//        while ([[strings lastObject] isEqualToString:@"0"]) {
//            [strings removeLastObject];
//        }
        
        NSString *lastIndex = [strings lastObject];
        for(int i = 0; i < lastIndex.length; i++)
        {
            NSRange range = [lastIndex rangeOfString:@"0" options:NSBackwardsSearch];
            if (range.location != NSNotFound) {
                lastIndex = [lastIndex substringToIndex:range.location];
            } else {
                break;
            }
        }
        self.indikatorLabel.text = [(NSString*)strings[0] stringByAppendingString:[NSString stringWithFormat:@".%@",lastIndex]];
    }
    
    
//    if((value * 10000) == (((int)value) * 10000))
//    {
//        self.indikatorLabel.text = [NSString stringWithFormat:@"%.3f", value];
//    }
//    else if((value * 1000) == (((int)value) * 1000))
//    {
//        self.indikatorLabel.text = [NSString stringWithFormat:@"%.2f", value];
//    }
//    else if(value == (int)value)
//    {
//        self.indikatorLabel.text = [NSString stringWithFormat:@"%.1f", value];
//    }
//    else if(value == (int)value)
//    {
//        self.indikatorLabel.text = [NSString stringWithFormat:@"%.0f", value];
//    }
//    else
//    {
//        self.indikatorLabel.text = [NSString stringWithFormat:@"%.6f", value];
//    }
    //self.model.currentOperand = value;
    
}
@end
