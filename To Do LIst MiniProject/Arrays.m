//
//  Arrays.m
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "Arrays.h"

@implementation Arrays
{
    
    NSMutableArray *todo;
    NSMutableArray *inpross;
    NSMutableArray *done;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        todo = [NSMutableArray new];
        inpross = [NSMutableArray new];
        done = [NSMutableArray new];
    }
    return self;
}


-(void)setintodo:(Task *)t{
    [todo addObject:t];
}
-(void)setininprg:(Task *)t;
{
    [inpross addObject:t];
}
-(void)setindone:(Task *)t{
    [done addObject:t];
    
    
}
-(Task *)getobjectfromtodo:(int)indx{
    return [todo objectAtIndex:indx];
}
-(Task *)getobjectfromtinprg:(int)indx{
     return[inpross objectAtIndex:indx];
}
-(Task *)getobjectfromdone:(int)indx{
     return[done objectAtIndex:indx];
}
-(int)gettodocount{
    return todo.count;
}
-(int)getinprogcount{
    return inpross.count;
}
-(int)getdonecount{
    return done.count;
}
-(void)removefromtodo:(int)index{
    [todo removeObjectAtIndex:index];
}
-(void)removefrominprog:(int)index{
    [inpross removeObjectAtIndex:index];
}
-(void)removefromdone:(int)index{
    [done removeObjectAtIndex:index];
    
}
@end
