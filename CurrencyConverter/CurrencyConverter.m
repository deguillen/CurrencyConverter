//
//  CurrencyConverter.m
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/12/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import "CurrencyConverter.h"

@implementation CurrencyConverter
@synthesize firstValue;
@synthesize secondValue;
@synthesize firstCurrency;
@synthesize secondCurrency;

static CurrencyConverter* converter;


+(CurrencyConverter*) converterExists {
    if(!converter) {
        converter = [[CurrencyConverter alloc] init];
       
    }
    
        return converter;
    
}
@end
