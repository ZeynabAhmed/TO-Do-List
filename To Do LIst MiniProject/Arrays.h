//
//  Arrays.h
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface Arrays : NSObject


    
   

-(void)setintodo:(Task *)t;
-(void)setininprg:(Task *)t;
-(void)setindone:(Task *)t;
-(Task *)getobjectfromtodo:(int)indx;
-(Task *)getobjectfromtinprg:(int)indx;
-(Task *)getobjectfromdone:(int)indx;
-(int)gettodocount;
-(int)getinprogcount;
-(int)getdonecount;
-(void)removefromtodo:(int)index;
-(void)removefrominprog:(int)index;
-(void)removefromdone:(int)index;



@end
