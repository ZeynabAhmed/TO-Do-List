//
//  Edit.m
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/26/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "Edit.h"
#import "Task.h"
#import "ToDoTable.h"

@interface Edit ()
{
    
}
@property (weak, nonatomic) IBOutlet UITextField *na;
@property (weak, nonatomic) IBOutlet UITextField *desc;
@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UISegmentedControl *potseg;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typSeg;

@end

@implementation Edit
{
    Task *t;
    NSString * tp;
    NSString * por;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    t =[Task new];
    tp = [NSString new];
    por = [NSString new];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
}
- (IBAction)edit:(id)sender {
    [t setTname:_na.text];
    [t setDesc:_desc.text];
    [t setTyp:tp ];
    [t setTdate:_date.text];
    [t setPoriority: por];
    [_pr edittask:t:_i:_OldTy];
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)porsel:(id)sender {
    if(_potseg.selectedSegmentIndex == 0)
    {
        por = @"High ";
    }else if (_potseg.selectedSegmentIndex == 1)
    {
        por = @"Medium";
    }else if (_potseg.selectedSegmentIndex == 2)
    {
        por = @"Low";
    }
}
- (IBAction)typsel:(id)sender {
    if(_typSeg.selectedSegmentIndex == 0)
    {
       tp = @"To Do";
    }else if (_typSeg.selectedSegmentIndex == 1)
    {
        tp = @"In Progress";
    }else if (_typSeg.selectedSegmentIndex == 2)
    {
        tp = @"Done";
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
