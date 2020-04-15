//
//  Task.m
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "Task.h"

@implementation Task

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.tname forKey:@"tname"];
    [encoder encodeObject:self.desc forKey:@"desc"];
    [encoder encodeObject:self.tdate forKey:@"tdate"];
    [encoder encodeObject:self.poriority forKey:@"poriority"];
    [encoder encodeObject:self.typ forKey:@"typ"];
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
        self.tname = [decoder decodeObjectForKey:@"tname"];
        self.desc = [decoder  decodeObjectForKey:@"desc"];
        self.tdate = [decoder  decodeObjectForKey:@"tdate"];
        self.poriority = [decoder  decodeObjectForKey:@"poriority"];
        self.typ = [decoder  decodeObjectForKey:@"typ"];

    }
    return self;
}

@end
