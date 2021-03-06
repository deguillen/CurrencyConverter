//
//  ExchangeRate.h
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/13/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"
@interface ExchangeRate : NSObject <NSCoding, NSCopying>

@property (strong, nonatomic) Currency* home;
@property (strong, nonatomic) Currency* foriegn;
@property (strong, nonatomic) NSNumber* rate;
@property (strong, nonatomic) NSDate* date;
@property (strong, nonatomic) NSURL* url;
@property (strong, nonatomic) NSString* shortcut;

+(NSArray*) currencyArray;
+(void) unAr; 
+(void) ar;
+(void) updateAllRates; 

-(NSString*) shortcut; 
 -(bool) updateRate;
/* -(NSString*) exchangeToHome: (NSNumber*) value;
-(NSString*) exchangeToForeign: (NSNumber*) value;
-(void) reverse;
-(NSString*) name;
-(NSString*) description; */

 -(ExchangeRate*) initWithHome: (Currency*) a other: (Currency*) b;

-(NSString*) convert: (NSNumber*) n;

 
@end

