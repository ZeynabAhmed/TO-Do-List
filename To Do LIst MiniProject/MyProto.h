//
//  MyProto.h
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
@protocol MyProto <NSObject>
-(void)addtask:(Task *)T;
-(void)edittask:(Task *)task:(int)index:(NSString*)OldTy;
@end
