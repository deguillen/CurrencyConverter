//
//  ViewController.h
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/12/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textBoxOne;


@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerOne;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerTwo;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

