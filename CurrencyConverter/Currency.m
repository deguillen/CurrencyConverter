//
//  Currency.m
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/13/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import "Currency.h"

@implementation Currency

-(Currency*) initWithName: (NSString*) aName code: (NSString*) aCode symbol: (NSString*) aSymbol decimalPlaces: (NSNumber*) aPlace {
    
    self = [super init];
    if(self) {
    self.name = aName;
    self.alphaCode = aCode;
    self.formatter = [[NSNumberFormatter alloc] init];
    self.formatter.currencySymbol = aSymbol;
    self.formatter.numberStyle = kCFNumberFormatterCurrencyStyle;
    [self.formatter setMaximumFractionDigits:[aPlace integerValue]];
        [self.formatter setMinimumFractionDigits:[aPlace integerValue]]; }
    //formatter code
    
    return self;
}
-(NSString*) format: (NSNumber*) quantity {
    return [self.formatter stringFromNumber:quantity];
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.alphaCode forKey:@"alphacode"];
    [encoder encodeObject:self.formatter forKey:@"formatter"];
}
- (Currency*)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if(self){
        self.name = [decoder decodeObjectOfClass:[Currency class] forKey:@"name"];
        self.alphaCode = [decoder decodeObjectOfClass:[Currency class] forKey:@"alphacode"];
        self.formatter = [decoder decodeObjectOfClass:[Currency class] forKey:@"formatter"];
    }
    return self;
}


@end
