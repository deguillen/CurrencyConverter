//
//  ExchangeRate.m
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/13/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import "ExchangeRate.h"

@implementation ExchangeRate

static NSMutableArray* pastConversions; 
static NSArray* array;

+(ExchangeRate*) initWithHome: (Currency*) a other: (Currency*) b; {
    ExchangeRate* er = [[ExchangeRate alloc] init];
    if(er) {
        
        er.home = a;
        er.foriegn = b;
    }
    return er;
    
}

-(void) changeCurrency: (Currency*) a other: (Currency*) b {
    self.home = a;
    self.foriegn = b;
    
}
-(bool) updateRate {
    
    bool successful =YES;
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSURLSessionConfiguration *ephemeralConfigObject;
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: ephemeralConfigObject delegate: nil delegateQueue: mainQueue];
    
    
    
        NSURLSessionTask* task = [delegateFreeSession dataTaskWithURL: [self url]
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        /*NSLog(@"Got response %@ with error %@.\n", response, error); */
                                                        id obj = [NSJSONSerialization JSONObjectWithData: data
                                                                                                 options: 0
                                                                                                   error: nil];
                                                        if( [obj isKindOfClass: [NSDictionary class]] ){
                                                            NSDictionary *dict = (NSDictionary*)obj;
                                        
                                                            NSNumberFormatter* f = [[NSNumberFormatter alloc] init];
                                        
                                                            self.rate = [f numberFromString:[[[[dict objectForKey:@"query"] objectForKey:@"results"] objectForKey:@"rate"] objectForKey:@"Rate"]];
                                                            NSLog(@" rate is %@",[self.rate stringValue]);
                                                            
                                                        }else{
                                                    NSLog(@"Not a dictionary.");
                                                            
                                                            
                                                        }
                                                        /*NSLog(@"DATA:\n%@\nEND DATA\n",
                                                         [[NSString alloc] initWithData: data
                                                         encoding: NSUTF8StringEncoding]);*/
                                                    }];
        [task resume];
    
   
    
    
    return successful;
}
-(NSURL*) url {
    NSString* urlString = [NSString stringWithFormat:@"https://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20yahoo.finance.xchange%%20where%%20pair%%20in%%20(%%22%@%@%%22)&format=json&diagnostics=true&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys&callback=", self.home.alphaCode,self.foriegn.alphaCode];
    
    return [NSURL URLWithString:urlString];
}
+(NSArray*) currencyArray {
    if(!array) {
        array = [NSArray arrayWithObjects: [Currency initWithName:@"US Dollar" code:@"USD" symbol:@"$" decimalPlaces: [NSNumber numberWithLong:2]],
         [Currency initWithName:@"Euro" code:@"EUR" symbol:@"€" decimalPlaces: [NSNumber numberWithLong:2]],
         [Currency initWithName:@"British Pound" code:@"GBP" symbol:@"£" decimalPlaces: [NSNumber numberWithLong:2]],
         [Currency initWithName:@"Japanese Yen" code:@"JPY" symbol:@"‎¥" decimalPlaces: [NSNumber numberWithLong:0]],
        [Currency initWithName:@"Norwegian Krone" code:@"NOK" symbol:@"‎kr" decimalPlaces: [NSNumber numberWithLong:0]],nil];
    }
    return array;
}

@end

