//
//  ToDoTable.m
//  To Do LIst MiniProject
//
//  Created by Jets39 on 12/22/19.
//  Copyright © 2019 Jets39. All rights reserved.
//

#import "ToDoTable.h"
#import "Task.h"
#import "ViewController.h"
#import "Show Detailes.h"
#import "InprogressTable.h"
#import "Arrays.h"
#import "Edit.h"

@interface ToDoTable ()
{
    NSMutableArray *todo,*inpross,*done;
    NSUserDefaults *defaults ;
    NSMutableArray * Titles;
    NSMutableArray * Filter;
    BOOL isFiltered;
    
    }

@end

@implementation ToDoTable
{
    int deletIndex , secIndex;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.Search.delegate = self;
    //Titles =[NSMutableArray new];
    //Filter =[NSMutableArray new];

    self.title =@"TO DO List";
    //A =[Arrays new];
    todo =[NSMutableArray new];
    inpross =[NSMutableArray new];
    done =[NSMutableArray new];
    defaults = [NSUserDefaults standardUserDefaults];
    isFiltered = false;

    
}
-(void)addtask:(Task *)T
{
    
    if([[T typ ] isEqual:@"To Do"])
    {
        //[A setintodo:T];
        [todo addObject:T];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:todo] forKey:@"todo"];
        

    }else if ([[T typ ]isEqual:@"In Progress"])
    {
        //[A setininprg:T];
        [inpross addObject:T];
        
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:inpross] forKey:@"inpross"];
        
        printf("in pross ");
        //InprogressTable * pro =[self.storyboard instantiateViewControllerWithIdentifier:@"Inprogress"];
        //[pro.inp addObject:T];
        
    }else if ([[T typ ]isEqual:@"Done"])
    {
        [done addObject:T];
        //[A setintodo:T];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:done] forKey:@"done"];
        printf("done ");
    }
   // [Titles addObject:T.tname];
    //[defaults setObject:Titles forKey:@"names"];

}
-(void)edittask:(Task *)task:(int)index:(NSString*)OldTy;
{
    if([[task typ ] isEqual:@"To Do"])
    {
        [todo addObject:task];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:todo] forKey:@"todo"];
        
        
    }else if ([[ task typ ]isEqual:@"In Progress"])
    {
        [inpross addObject:task];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:inpross] forKey:@"inpross"];
        printf("in pross ");
        
    }else if ([[task typ ]isEqual:@"Done"])
    {

        [done addObject:task];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:done] forKey:@"done"];
        printf("done ");
    }
    else{
        printf("Wrong type ");
    }
    //////////////
    
    if([ OldTy isEqual:@"To Do"])
    {
        [todo removeObjectAtIndex:index];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:todo] forKey:@"todo"];
        
        
    }else if ([OldTy isEqual:@"In Progress"])
    {
        [inpross removeObjectAtIndex:index];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:inpross] forKey:@"inpross"];
        printf("in pross ");
        
    }else if ([OldTy isEqual:@"Done"])
    {
        
        [done removeObjectAtIndex:index];
        [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:done] forKey:@"done"];
        printf("done ");
    }
    else{
        printf("Wrong type ");
    }
    


    
    
}


-(void)viewWillAppear:(BOOL)animated
{
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
    Titles = [defaults objectForKey:@"todo"];

       self.tableView.reloadData;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    NSUInteger numofsection = 3;
    /*if (isFiltered) {
        
        return   numofsection;
        
    }*/

    return numofsection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    NSInteger  numofrow = 0;
    //if(isFiltered)
    //{
        // numofrow = [Filter count];
    //}
   // else{
        switch (section) {
            case 0:
                numofrow = [todo count];
                //numofrow= [A gettodocount] ;
                break;
            case 1:
                numofrow = [inpross count];
                //numofrow=[A getinprogcount];
                break;
            case 2:
                numofrow = [done count];
                //numofrow=[A getdonecount];
                break;
            default:
                break;
        }

    //}
        return numofrow;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        //if(isFiltered)
        //{
            //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
            //cell.textLabel.text = [Filter objectAtIndex:indexPath.row] ;
        //}else
        //{
            switch (indexPath.section) {    // poriority=@[@"High",@"Medium",@"Low"];
                case 0:
                    if([[[todo objectAtIndex:indexPath.row] poriority ] isEqual:@"High"])
                    {
                        cell.imageView.image =[UIImage imageNamed:@"1.png"] ;
                
                    }
                    else if([[[todo objectAtIndex:indexPath.row] poriority ] isEqual:@"Medium"]){
                        cell.imageView.image =[UIImage imageNamed:@"2.png"] ;
                    }
                    else if([[[todo objectAtIndex:indexPath.row] poriority ] isEqual:@"Low"]){
                        cell.imageView.image =[UIImage imageNamed:@"3.png"] ;
                
                    }
            cell.accessoryType=UITableViewCellAccessoryDetailButton;
            cell.textLabel.text = [[todo objectAtIndex:indexPath.row] tname];
            break;
        case 1:
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
            
            
            cell.textLabel.text = [[inpross objectAtIndex:indexPath.row] tname];
            cell.accessoryType=UITableViewCellAccessoryDetailButton;
            break;
        case 2:
            if([[[done objectAtIndex:indexPath.row] poriority ] isEqual:@"High"])
            {
                cell.imageView.image =[UIImage imageNamed:@"1.png"] ;
                
            }
            else if([[[done objectAtIndex:indexPath.row] poriority ] isEqual:@"Medium"]){
                cell.imageView.image =[UIImage imageNamed:@"2.png"] ;
            }
            else if([[[done objectAtIndex:indexPath.row] poriority ] isEqual:@"Low"]){
                cell.imageView.image =[UIImage imageNamed:@"3.png"] ;
                
            }
            
            cell.textLabel.text = [[done objectAtIndex:indexPath.row] tname];
            cell.accessoryType=UITableViewCellAccessoryDetailButton;
            break;
        default:
            break;
        //}
    

        }

          
    
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *secTitle = @"" ;
    switch (section) {
        case 0:
            secTitle = @"To Do";
            break;
        case 1:
            secTitle = @"In Progress";
            break;
        case 2:
            secTitle = @"Done";
            break;
        default:
            break;
    }
    
    return secTitle;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (IBAction)add:(id)sender {
    ViewController *v =[self.storyboard instantiateViewControllerWithIdentifier:@"addtask"];
    [v setP:self];
    [self.navigationController pushViewController:v animated:YES];

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    Edit * e=[self.storyboard instantiateViewControllerWithIdentifier:@"edit"];
    [e setI:indexPath.row];
    switch (indexPath.section) {
        case 0:
            [e setOldTy:@"To Do" ];
            break;
        case 1:
            [e setOldTy:@"In Progress" ];

            break;
        case 2:
            [e setOldTy:@"Done" ];

            break;
            
        default:
            break;
    }
    [e setPr:self];
    [self.navigationController pushViewController:e animated:YES];
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    Show_Detailes * sh=[self.storyboard instantiateViewControllerWithIdentifier:@"Show"];
    
    switch (indexPath.section) {
        case 0:
            [sh setName:[[todo objectAtIndex:indexPath.row]tname]];
            [sh setTy:[[todo objectAtIndex:indexPath.row]typ]];
            [sh setDec:[[todo objectAtIndex:indexPath.row]desc]];
            [sh setPor:[[todo objectAtIndex:indexPath.row]poriority]];
            [sh setDate:[[todo objectAtIndex:indexPath.row]tdate]];
            
            break;
        case 1:
            [sh setName:[[inpross objectAtIndex:indexPath.row]tname]];
            [sh setTy:[[inpross objectAtIndex:indexPath.row]typ]];
            [sh setDec:[[inpross objectAtIndex:indexPath.row]desc]];
            [sh setPor:[[inpross objectAtIndex:indexPath.row]poriority]];
            [sh setDate:[[inpross objectAtIndex:indexPath.row]tdate]];
            break;
        case 2:
            [sh setName:[[done objectAtIndex:indexPath.row]tname]];
            [sh setTy:[[done objectAtIndex:indexPath.row]typ]];
            [sh setDec:[[done objectAtIndex:indexPath.row]desc]];
            [sh setPor:[[done objectAtIndex:indexPath.row]poriority]];
            [sh setDate:[[done objectAtIndex:indexPath.row]tdate]];
            
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:sh animated:YES];
    
    

    
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView * Al= [[UIAlertView alloc]initWithTitle:@"Delete" message:@"Are you Sure you want to delete" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    Al.alertViewStyle=UIAlertViewStyleDefault;
    [Al show];
    deletIndex= indexPath.row;
    secIndex = indexPath.section;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        switch (secIndex) {
        case 0:
                //[A removefromtodo:deletIndex];
            [todo removeObjectAtIndex:deletIndex];
            [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:todo] forKey:@"todo"];

            break;
        case 1:
               // [A removefrominprog:deletIndex];
           [inpross removeObjectAtIndex:deletIndex];
         [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:inpross] forKey:@"inpross"];

            break;
        case 2:
                //[A removefromdone:deletIndex];
            [done removeObjectAtIndex:deletIndex];
            [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:done] forKey:@"done"];

            break;
        default:
            break;
        }
        
    }
    self.tableView.reloadData;
}


@end
