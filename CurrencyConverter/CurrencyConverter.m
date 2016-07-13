//
//  CurrencyConverter.m
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/12/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
// DELETE THIS 

#import "CurrencyConverter.h"

@implementation CurrencyConverter
@synthesize firstValue;
@synthesize secondValue;


static CurrencyConverter* converter;


+(CurrencyConverter*) converterExists {
    if(!converter) {
        converter = [[CurrencyConverter alloc] init];
       
    }
    
        return converter;
    
}





@end
