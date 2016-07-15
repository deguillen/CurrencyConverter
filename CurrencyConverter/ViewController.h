//
//  ViewController.h
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/12/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExchangeRate.h"
#import "Currency.h" 

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property ExchangeRate* currentRate;

@property (weak, nonatomic) IBOutlet UITextField *textBoxOne;


@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerOne;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerTwo;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong, nonatomic) NSMutableArray* pastRates; 

@end

