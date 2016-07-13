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
    self.listofCurrencies = [[NSArray alloc]  initWithObjects: @"select", @"US dollar", @"Euro", @"British Pound", @"Japanese Yen", @"Norwegian krone", nil];
    [self.textBoxOne setKeyboardType: UIKeyboardTypeDecimalPad];
    [self.textBoxTwo setKeyboardType: UIKeyboardTypeDecimalPad];
    self.pickerOne.tag = 1;
    self.pickerTwo.tag = 2;
    
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
    return [self.listofCurrencies count];
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED {
    return [self.listofCurrencies objectAtIndex:(row)];
}

- (IBAction)refreshPressed:(id)sender {
    //refresh code
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@ "touch");
    
    if([self.textBoxOne isFirstResponder]) {
        [self.textBoxOne resignFirstResponder];
    }
    if([self.textBoxTwo isFirstResponder]) {
        [self.textBoxTwo resignFirstResponder];
    }
    else {
        NSLog(@"error...no first responder");
    }
}

- (IBAction)oneEditingEnd:(id)sender {
    int deci = 0;
    for (int count =1; count <= ([self.textBoxOne.text length] ); count++) {
        if([self.textBoxOne.text characterAtIndex:count-1] == '.') {
            deci++;
            
        }
        
    }
    if(deci > 1) {
        [self.textBoxOne setText: @""];
    }
    else {
        [[CurrencyConverter converterExists] setFirstValue: [NSNumber numberWithDouble:[self.textBoxOne.text doubleValue]]];
        //code to get value from textbox
    }
}

- (IBAction)twoEditingEnd:(id)sender {
    int deci = 0;
    for (int count =1; count <= ([self.textBoxTwo.text length] ); count++) {
        if([self.textBoxTwo.text characterAtIndex:count-1] == '.') {
            deci++;
            
        }
        
    }
    if(deci > 1) {
        [self.textBoxTwo setText: @""];
    }
    else {
        [[CurrencyConverter converterExists] setSecondValue: [NSNumber numberWithDouble:[self.textBoxTwo.text doubleValue]]];
        //code to get value from textbox
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag==1) {
     
        [[[CurrencyConverter converterExists] exr] home] = [[ExchangeRate currencyArray] objectAtIndex:(row+1)];
        
        
        //code for first pickerview
        
    }else if(pickerView.tag==2){
        
        //code for second pickerview 
    }
    else {
        NSLog(@"No picker view");
    }
}
- (IBAction)oneBoxBegin:(id)sender {
    [self.textBoxOne setText:@""];
}

- (IBAction)twoBoxBegin:(id)sender {
    [self.textBoxTwo setText:@""];
}


@end
