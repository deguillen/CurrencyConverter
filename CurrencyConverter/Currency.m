//
//  Currency.m
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/13/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import "Currency.h"

@implementation Currency

+(Currency*) initWithName: (NSString*) aName code: (NSString*) aCode symbol: (NSString*) aSymbol decimalPlaces: (NSNumber*) aPlace {
    
    Currency* curr = [[Currency alloc] init];
    curr.name = aName;
    curr.alphaCode = aCode;
    curr.formatter = [[NSNumberFormatter alloc] init];
    curr.formatter.currencySymbol = aSymbol;
    curr.formatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    [curr.formatter setMaximumFractionDigits:[aPlace integerValue]];
    [curr.formatter setMinimumFractionDigits:[aPlace integerValue]];
    //formatter code
    
    return curr;
}
-(NSString*) format: (NSNumber*) quantity {
    return [self.formatter stringFromNumber:quantity];
}


@end
