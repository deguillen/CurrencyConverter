//
//  CurrencyConverter.h
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/12/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyConverter : NSObject

+(CurrencyConverter*) converterExists;
@property (strong, nonatomic) NSNumber* firstValue;
@property (strong, nonatomic) NSNumber* secondValue;
@property (strong, nonatomic) NSNumber* firstCurrency;
@property (strong, nonatomic) NSNumber* secondCurrency; 


@end
