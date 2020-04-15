//
//  PoriorityTable.m
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "PoriorityTable.h"
#import "Task.h"

@interface PoriorityTable ()


@end

@implementation PoriorityTable
{
    NSMutableArray *todo,*inpross,*done;
    NSUserDefaults *defaults ;
    NSMutableArray *low,*med,*high;
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    todo =[NSMutableArray new];
    inpross =[NSMutableArray new];
    done =[NSMutableArray new];
    
    defaults = [NSUserDefaults standardUserDefaults];
    
   }
-(void)viewWillAppear:(BOOL)animated
{
    
    low =[NSMutableArray new];
    med =[NSMutableArray new];
    high =[NSMutableArray new];
    NSData* dataRepresentingSavedArray = [defaults objectForKey:@"todo"];
    todo =nil;
    
    
    if (dataRepresentingSavedArray != nil)
    {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray];
        if (savedArray != nil)
        {
            todo = [[NSMutableArray alloc] initWithArray:savedArray];
            
            
        }
        else
            todo = [NSMutableArray new];
        
    }
    
    
    
    NSData* dataRepresentingSavedArray1 = [defaults objectForKey:@"inpross"];
    inpross =nil;
    if (dataRepresentingSavedArray1 != nil)
    {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray1];
        if (savedArray != nil)
        {
            inpross = [[NSMutableArray alloc] initWithArray:savedArray];
            
            
        }
        else
            inpross = [NSMutableArray new];
        
    }
    NSData* dataRepresentingSavedArray2 = [defaults objectForKey:@"done"];
    done =nil;
    if (dataRepresentingSavedArray2 != nil)
    {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:dataRepresentingSavedArray2];
        if (savedArray != nil)
        {
            done = [[NSMutableArray alloc] initWithArray:savedArray];
            
            
        }
        else
            done = [NSMutableArray new];
        
    }
    //poriority=@[@"High",@"Medium",@"Low"];
    for(int i=0;i<[todo count];i++)
    {
        if([[[todo objectAtIndex:i] poriority] isEqual:@"High"])
        {
            [high addObject:[todo objectAtIndex:i]];
        }
        else if ([[[todo objectAtIndex:i] poriority] isEqual:@"Medium"])
        {
            [med addObject:[todo objectAtIndex:i]];
        }
        else if ([[[todo objectAtIndex:i] poriority] isEqual:@"Low"])
        {
            [low addObject:[todo objectAtIndex:i]];

        }
    }
    for(int i=0;i<[inpross count];i++)
    {
        if([[[inpross objectAtIndex:i] poriority] isEqual:@"High"])
        {
            [high addObject:[inpross objectAtIndex:i]];
        }
        else if ([[[inpross objectAtIndex:i] poriority] isEqual:@"Medium"])
        {
            [med addObject:[inpross objectAtIndex:i]];
        }
        else if ([[[inpross objectAtIndex:i] poriority] isEqual:@"Low"])
        {
            [low addObject:[inpross objectAtIndex:i]];
            
        }
    }
    for(int i=0;i<[done count];i++)
    {
        if([[[done objectAtIndex:i] poriority] isEqual:@"High"])
        {
            [high addObject:[done objectAtIndex:i]];
        }
        else if ([[[done objectAtIndex:i] poriority] isEqual:@"Medium"])
        {
            [med addObject:[done objectAtIndex:i]];
        }
        else if ([[[done objectAtIndex:i] poriority] isEqual:@"Low"])
        {
            [low addObject:[done objectAtIndex:i]];
            
        }
    }
    
    self.tableView.reloadData;

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger  numofrow = 0;
    switch (section) {
        case 0:
            numofrow = [high count];
            //numofrow= [A gettodocount] ;
            break;
        case 1:
            numofrow = [med count];
            //numofrow=[A getinprogcount];
            break;
        case 2:
            numofrow = [low count];
            //numofrow=[A getdonecount];
            break;
        default:
            break;
    }
    return numofrow;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [[high objectAtIndex:indexPath.row] tname];
            cell.imageView.image =[UIImage imageNamed:@"1.png"] ;

            break;
        case 1:
            cell.textLabel.text = [[med objectAtIndex:indexPath.row] tname];
            cell.imageView.image =[UIImage imageNamed:@"2.png"] ;

            break;
        case 2:
            cell.textLabel.text = [[low objectAtIndex:indexPath.row] tname];
            cell.imageView.image =[UIImage imageNamed:@"3.png"] ;

            break;
    }
    return cell;
}
    
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
        
        NSString *secTitle = @"" ;
        switch (section) {
            case 0:
                secTitle = @"High";
                break;
            case 1:
                secTitle = @"Medium";
                break;
            case 2:
                secTitle = @"Low";
                break;
            default:
                break;
        }
        
        return secTitle;
        
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
