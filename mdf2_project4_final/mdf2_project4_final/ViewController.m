//
//  ViewController.m
//  mdf2_project4_final
//
//  Created by Monica Peters on 1/28/13.
//  Copyright (c) 2013 Monica Peters. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize theTableView,theaterList,theaterName,theaterAddress,theaterImage,movieTitle,movieRating,movieTimes,movieThumbnail,header,footer,footerProjectLabel,theaterNameLabel,theaterAddressLabel,theaterHeaderImage;

- (void)viewDidLoad
{
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    allMovies = appDelegate.movieList;
    theaterList = [allMovies.theaters objectForKey:@"TheatersList"];
    NSLog(@"%@", theaterList);
	[super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setTheTableView:nil];
    [super viewDidUnload];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [theaterList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *movieList = [NSArray arrayWithArray:[[theaterList objectForKey:[NSString stringWithFormat:@"Theater %d", section]]objectForKey:@"Movies"]];
    NSLog(@"%@", movieList);
    NSInteger numMovies = [movieList count];
    return numMovies;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 55.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 45.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	footer = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, theTableView.frame.size.width, 50.0f)];
	[footer setBackgroundColor:[UIColor blackColor]];
	
	footerProjectLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 280.0f, 40.0f)];
    [footerProjectLabel setBackgroundColor:[UIColor clearColor]];
    [footerProjectLabel setFont:[UIFont systemFontOfSize:12.0f]];
    [footerProjectLabel setTextColor:[UIColor grayColor]];
	[footerProjectLabel setTextAlignment:NSTextAlignmentRight];
	[footerProjectLabel setText:@"MDF2 Project 4 :: Full Sail :: Monica Peters"];
	
	[footer addSubview:footerProjectLabel];
	return footer;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    header = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, theTableView.frame.size.width, 50.0f)];
    [header setBackgroundColor:[UIColor blackColor]];
	
	theaterNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 0.0f, 280.0f, 20.0f)];
    [theaterNameLabel setBackgroundColor:[UIColor clearColor]];
    [theaterNameLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
    [theaterNameLabel setTextColor:[UIColor whiteColor]];
    
	theaterAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 30.0f, 200.0f, 20.0f)];
    [theaterAddressLabel setBackgroundColor:[UIColor clearColor]];
    [theaterAddressLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
    [theaterAddressLabel setTextColor:[UIColor lightTextColor]];
    
	theaterHeaderImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
    
    
    theaterName = [[[theaterList objectForKey:[NSString stringWithFormat:@"Theater %d",section]] objectForKey:@"TheaterInfo"]objectForKey:@"theaterName"];
    theaterImage = [[[theaterList objectForKey:[NSString stringWithFormat:@"Theater %d",section]] objectForKey:@"TheaterInfo"]objectForKey:@"theaterThumbnail"];
    theaterAddress = [[[theaterList objectForKey:[NSString stringWithFormat:@"Theater %d",section]] objectForKey:@"TheaterInfo"]objectForKey:@"address"];
    
    NSLog(@"theaterName %@ theaterAddress%@",theaterName, theaterAddress);

    if (theaterName != nil)
    {
        [theaterNameLabel setText:theaterName];
    }
    
    if (theaterAddress != nil)
    {
        [theaterAddressLabel setText:theaterAddress];
    }
    
    if (theaterImage != nil)
    {
        [theaterHeaderImage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:theaterImage ofType:@"png" inDirectory:@"images"]]];
    }
	else
	{
		[theaterHeaderImage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:theaterImage ofType:@"png" inDirectory:@"images"]]];
	}

    [header addSubview:theaterNameLabel];
    [header addSubview:theaterAddressLabel];
    [header addSubview:theaterHeaderImage];
	NSLog(@"%@", theaterHeaderImage);
    return header;
}

- (MovieTableCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    MovieTableCell *movieCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    NSArray *movieList = [NSArray arrayWithArray:[[theaterList objectForKey:[NSString stringWithFormat:@"Theater %d", indexPath.section]]objectForKey:@"Movies"]];
    
	movieTitle = [[movieList objectAtIndex:indexPath.row]objectForKey:@"title"];
    movieTimes = [[movieList objectAtIndex:indexPath.row]objectForKey:@"showtimes"];
    movieRating = [[movieList objectAtIndex:indexPath.row]objectForKey:@"rating"];
    movieThumbnail = [[movieList objectAtIndex:indexPath.row]objectForKey:@"thumbnail"];
    
    [movieCell.movieTitle setText:movieTitle];
    [movieCell.showTime setText:movieTimes];
    [movieCell.movieRating setText:movieRating];
    [movieCell.movieThumbnail setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:movieThumbnail ofType:@"png" inDirectory:@"images"]]];
    
    return movieCell;
}


#pragma Table View storyboard segue functions for selection, editing, deletion
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destination = segue.destinationViewController;
    
    if([destination respondsToSelector:@selector(setDelegate:)])
    {
        [destination setValue:self forKey:@"delegate"];
    }
    if ([destination respondsToSelector:@selector(setSelectedItem:)])
    {
        NSIndexPath *indexPath = [self.theTableView indexPathForCell:sender];
        NSDictionary *item = [NSDictionary dictionaryWithDictionary:[[[theaterList objectForKey:[NSString stringWithFormat:@"Theater %d", indexPath.section]]objectForKey:@"Movies"]objectAtIndex:indexPath.row]];
        [destination setValue:item forKey:@"selectedItem"];
    }
}
@end
