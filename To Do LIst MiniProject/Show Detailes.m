//
//  Show Detailes.m
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "Show Detailes.h"
#import "ToDoTable.h"

@interface Show_Detailes ()
@property (weak, nonatomic) IBOutlet UILabel *tna;
@property (weak, nonatomic) IBOutlet UILabel *tDesc;
@property (weak, nonatomic) IBOutlet UILabel *tdate;
@property (weak, nonatomic) IBOutlet UILabel *Tpor;
@property (weak, nonatomic) IBOutlet UILabel *ttype;

@end

@implementation Show_Detailes

- (void)viewDidLoad {
    [super viewDidLoad];
    
    }
-(void)viewWillAppear:(BOOL)animated
{
    _tna.text = _name;
    _tDesc.text =_dec;
    _tdate.text = _date;
    _Tpor.text = _por;
    _ttype.text = _ty;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
