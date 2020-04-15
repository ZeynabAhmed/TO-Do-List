//
//  InprogressTable.m
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "InprogressTable.h"
#import "Task.h"

@interface InprogressTable ()

@end

@implementation InprogressTable
{
    NSUserDefaults * defaults ;
    NSMutableArray *inpross;
}

 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"Inprogress List";
    inpross =[NSMutableArray new];
     defaults = [NSUserDefaults standardUserDefaults];
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
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
    self.tableView.reloadData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [inpross count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[inpross objectAtIndex:indexPath.row]tname];
    if([[[inpross objectAtIndex:indexPath.row] poriority ] isEqual:@"High"])
    {
        cell.imageView.image =[UIImage imageNamed:@"1.png"] ;
        
    }
    else if([[[inpross objectAtIndex:indexPath.row] poriority ] isEqual:@"Medium"]){
        cell.imageView.image =[UIImage imageNamed:@"2.png"] ;
    }
    else if([[[inpross objectAtIndex:indexPath.row] poriority ] isEqual:@"Low"]){
        cell.imageView.image =[UIImage imageNamed:@"3.png"] ;
        
    }
    

    
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *secTitle = @"In Progress" ;
    
    return secTitle;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
