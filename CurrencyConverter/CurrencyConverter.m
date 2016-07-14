//
//  CurrencyConverter.m
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/12/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
// DELETE THIS

#import "CurrencyConverter.h"

@implementation CurrencyConverter

@synthesize firstCurrency;
@synthesize secondCurrency; 

static CurrencyConverter* converter;


+(CurrencyConverter*) converterExists {
    if(!converter) {
        converter = [[CurrencyConverter alloc] init];
        
       
    }
    if(converter.exr == nil) {
        
         converter.exr = [ExchangeRate initWithHome:[[ExchangeRate currencyArray] objectAtIndex:0]   other:[[ExchangeRate currencyArray] objectAtIndex:0]];
        
    }
    
        return converter;
    
}

-(NSString*) convert: (NSNumber*) n {
    
    [self.exr changeCurrency:[[ExchangeRate currencyArray] objectAtIndex:[self.firstCurrency intValue]] other:[[ExchangeRate currencyArray] objectAtIndex:[self.secondCurrency intValue]]];
    
    [self.exr updateRate];
    
    
   
    return [self.exr.foriegn.formatter stringFromNumber:[NSNumber numberWithFloat:[n floatValue] * [self.exr.rate floatValue]]];
   
    
   
}




@end
