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
-(NSString*) convert:(NSNumber*) n ;


@property (strong, nonatomic) ExchangeRate* exr;
@property (strong, nonatomic) NSNumber* firstCurrency;
@property (strong, nonatomic) NSNumber* secondCurrency;

@end


