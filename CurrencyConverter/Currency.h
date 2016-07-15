//
//  Currency.h
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/13/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject 

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* alphaCode;
@property (strong, nonatomic) NSString* symbol;
@property (strong, nonatomic) NSNumberFormatter* formatter;

-(Currency*) initWithName: (NSString*) aName code: (NSString*) aCode symbol: (NSString*) aSymbol decimalPlaces: (NSNumber*) aPlace;
-(NSString*) format: (NSNumber*) quantity;

@end
