//
//  CalculatorModel.m
//  Calcultor_hd_realise
//
//  Created by Artem Galagura on 27.04.17.
//  Copyright © 2017 Artem Galagura. All rights reserved.
//

#import "CalculatorModel.h"

@implementation CalculatorModel

-(CGFloat) performOperand:(CGFloat)operand{
    
    CGFloat value = self.currentOperand;
    
    if([self.operation isEqualToString:@"X"]){
        value *= operand;
    }else if([self.operation isEqualToString:@"/"]){
//        if(self.currentOperand == 0){
//            value = [NSString stringWithFormat:@"Eror"];
//        }
        value /= operand;
    }else if([self.operation isEqualToString:@"+"]){
        value += operand;
    }else if([self.operation isEqualToString:@"-"]){
        value -= operand;
    }
    return value;
}



@end
