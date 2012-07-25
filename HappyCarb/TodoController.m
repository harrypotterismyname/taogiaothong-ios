//
//  TodoViewController.m
//  HappyCarb
//
//  Created by Hong on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TodoController.h"
#import "Todo.h"
#import "SBJson.h"
#import "KeychainWrapper.h"
#import "SVPullToRefresh.h"

//ref: http://cocoamatic.blogspot.com/2010/07/uicolor-macro-with-hex-values.html
//RGB color macro
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGB color macro with alpha
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

//http://www.cimgf.com/2009/09/23/uitableviewcell-dynamic-height/
#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f



@interface TodoController ()

@end

@implementation TodoController

@synthesize Todos;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //ref: http://www.raywenderlich.com/5191/beginning-storyboards-in-ios-5-part-2
    
      Todos=   [Todo findAllRemote];

    
    //https://github.com/samvermette/SVPullToRefresh
    // setup the pull-to-refresh view
    [self.tableView addPullToRefreshWithActionHandler:^{
        NSLog(@"refresh dataSource");
        
        self.Todos=   [Todo findAllRemote];
        
        [self.tableView reloadData];
        
        [self.tableView.pullToRefreshView performSelector:@selector(stopAnimating) withObject:nil afterDelay:2];
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"load more data");
    }];

  
    
    
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//http://stackoverflow.com/questions/406212/sizing-a-uilabel-to-fit
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *text =  ((Todo *)[Todos objectAtIndex:[indexPath row]]).name;
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    CGFloat height = MAX(size.height, 28.0f);
    
    return height + (CELL_CONTENT_MARGIN * 3);  
//  return [indexPath row] * 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView 
                         dequeueReusableCellWithIdentifier:@"TodoCell"];
    cell.textLabel.text = ((Todo *)[Todos objectAtIndex:[indexPath row]]).name;// [Todos objectAtIndex:indexPath.row];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    //http://stackoverflow.com/questions/494562/setting-custom-uitableviewcells-height
    cell.textLabel.lineBreakMode =  UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines = 0;
     [cell.textLabel sizeToFit];
    


    //ref: http://stackoverflow.com/questions/281515/how-to-customize-the-background-color-of-a-uitableviewcell
    UIView* backgroundView =  [ [ UIView alloc ] initWithFrame:CGRectZero ]  ;

    
    
    backgroundView.backgroundColor =  UIColorFromRGB(0x57A30D); //HappyGreen;
    
    if (indexPath.row == 0 || indexPath.row%2 == 0) {

            backgroundView.backgroundColor =  UIColorFromRGB(0x57C30D); //change the color;
    }
    
    
    
    cell.backgroundView = backgroundView;
    for ( UIView* view in cell.contentView.subviews ) 
    {
        view.backgroundColor = [ UIColor clearColor ];
    }
    
    
    //ref: http://stackoverflow.com/questions/286332/how-do-i-remove-the-borders-of-a-uitableview
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section
{
	return [Todos count];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//   NSString *continent = [self tableView:tableView titleForHeaderInSection:indexPath.section];
//  NSString *country = [[self.countries valueForKey:continent] objectAtIndex:indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"You selected %@!", @"Vietnam"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
