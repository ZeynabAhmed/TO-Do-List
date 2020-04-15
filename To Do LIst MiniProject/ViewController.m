//
//  ViewController.m
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"

@interface ViewController ()
{
    NSArray * poriority;
    NSArray * Type;
    NSString *Tpor;
    NSString * Ttyp;
    Task * t;
    

    
}
@property (weak, nonatomic) IBOutlet UITextField *na;

@property (weak, nonatomic) IBOutlet UITextField *tdesc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    t = [Task new];
    poriority=@[@"High",@"Medium",@"Low"];
    Type = @[@"To Do",@"In Progress",@"Done"];
    Tpor =@"High";
    Ttyp =@"To Do";
    
    self.poriorityPickerV.dataSource = self;
    self.poriorityPickerV.delegate = self;
    self.typePickerV.dataSource = self;
    self.typePickerV.delegate = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int count = 0;
    switch (pickerView.tag) {
        case 1:
            count = poriority.count;
            break;
        case 2:
            count = Type.count;
            break;
        default:
            break;
    }
    return  count;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *data =@"";
    switch (pickerView.tag) {
        case 1:
            data = poriority[row];
            break;
        case 2:
            data = Type[row];
            break;
        default:
            break;
    }

    
    return data;
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (pickerView.tag) {
        case 1:
            Tpor = poriority[row];
            printf("%s", [Tpor UTF8String]);
            break;
        case 2:
            Ttyp = Type[row];
            printf("%s", [Ttyp UTF8String]);
            break;
        default:
            break;
    }

}
- (IBAction)tadd:(id)sender {
    
    [t setTname:_na.text];
    [t setDesc:_tdesc.text];
    [t setTyp:Ttyp];
    printf("%s",[Ttyp UTF8String]);
    [t setPoriority:Tpor];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
    [t setTdate:[dateFormatter stringFromDate:[NSDate date]]];
    [_p addtask:t];
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
