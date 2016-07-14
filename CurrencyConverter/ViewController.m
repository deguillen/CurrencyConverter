//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Daniela Guillen on 7/12/16.
//  Copyright © 2016 Daniela Guillen. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyConverter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.textBoxOne setKeyboardType: UIKeyboardTypeDecimalPad];
   
    self.pickerOne.tag = 1;
    self.pickerTwo.tag = 2;
    [[CurrencyConverter converterExists] setFirstCurrency:[NSNumber numberWithLong:0]];
    [[CurrencyConverter converterExists] setSecondCurrency:[NSNumber numberWithLong:0]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [[ExchangeRate currencyArray] count];
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED {
    return [[[ExchangeRate currencyArray] objectAtIndex:(row)] name];
}

- (IBAction)refreshPressed:(id)sender {
    //refresh code
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@ "touch");
    
    if([self.textBoxOne isFirstResponder]) {
        [self.textBoxOne resignFirstResponder];
    }
    
    else {
        NSLog(@"no first responder");
    }
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag==1) {
     
        [[CurrencyConverter converterExists] setFirstCurrency:[NSNumber numberWithLong:row]];
       
        
        //code for first pickerview
        
    }else if(pickerView.tag==2){
        [[CurrencyConverter converterExists] setSecondCurrency:[NSNumber numberWithLong:row]];
        
        
        //code for second pickerview 
    }
    else {
        NSLog(@"No picker view");
    }
}

- (IBAction)edit:(id)sender {
    NSNumberFormatter* fey = [[NSNumberFormatter alloc] init];
    [[CurrencyConverter converterExists] convert:[fey numberFromString:self.textBoxOne.text]];
    [self.resultLabel setText:[[CurrencyConverter converterExists] convert:[fey numberFromString:self.textBoxOne.text]]];
}



@end
