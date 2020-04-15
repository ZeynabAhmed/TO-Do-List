//
//  ViewController.h
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProto.h"
@interface ViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property id <MyProto> p;

@property (weak, nonatomic) IBOutlet UIPickerView *poriorityPickerV;
@property (weak, nonatomic) IBOutlet UIPickerView *typePickerV;

@end

