//
//  CalculatorModel.h
//  Calcultor_hd_realise
//
//  Created by Artem Galagura on 27.04.17.
//  Copyright © 2017 Artem Galagura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CalculatorModel : NSObject

@property (copy, nonatomic) NSString *operation;
@property (assign, nonatomic) CGFloat currentOperand;

-(CGFloat) performOperand:(CGFloat)operand;

@end
