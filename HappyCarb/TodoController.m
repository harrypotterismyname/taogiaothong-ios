//
//  TodoViewController.m
//  HappyCarb
//
//  Created by Hong on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TodoController.h"

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
    Todos = [NSArray arrayWithObjects:
             @"Angry Birds",
             @"Chess",
             @"Russian Roulette",
             @"Spin the Bottle",
             @"Texas Hold’em Poker",
             @"Tic-Tac-Toe",
             nil];
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

- (UITableViewCell *)tableView:(UITableView *)tableView 
cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
UITableViewCell *cell = [tableView 
                         dequeueReusableCellWithIdentifier:@"TodoCell"];
cell.textLabel.text = [Todos objectAtIndex:indexPath.row];
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

@end
