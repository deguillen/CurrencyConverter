//
//  CurrencyConverter.h
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/12/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExchangeRate.h"
@interface CurrencyConverter : NSObject

+(CurrencyConverter*) converterExists;

-(NSString*) convertCurrency;

@property (strong, nonatomic) NSNumber* firstValue;
@property (strong, nonatomic) NSNumber* secondValue;
@property (strong, nonatomic) ExchangeRate* exr;


@end
