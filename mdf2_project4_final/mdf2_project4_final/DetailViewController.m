//
//  DetailViewController.m
//  mdf2_project4_final
//
//  Created by Monica Peters on 1/28/13.
//  Copyright (c) 2013 Monica Peters. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize videoView,selectedItem,movieTitle,showTime,movieRating,movieThumbnail;

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
    [self.movieTitle setText:[selectedItem objectForKey:@"title"]];
    [self.showTime setText:[selectedItem objectForKey:@"showtimes"]];
    [self.movieRating setText:[selectedItem objectForKey:@"rating"]];
    [self.movieThumbnail setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[selectedItem objectForKey:@"thumbnail"] ofType:@"png" inDirectory:@"images"]]];
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:[selectedItem valueForKey:@"trailer"] ofType:@"mp4" inDirectory:@"movies"];
    NSLog(@"videopath %@", videoPath);
    NSLog(@"selectedItem %@", selectedItem);
    NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
    NSLog(@"videoURL %@", videoURL);
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    if (moviePlayer != nil)
    {
        [videoView addSubview:moviePlayer.view];
        moviePlayer.view.frame = videoView.bounds;
        moviePlayer.fullscreen = false;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
        moviePlayer.shouldAutoplay = NO;
    }
	[super viewDidLoad];
}


-(IBAction)onPlay:(id)sender
{
    [self.movieTitle setText:[selectedItem objectForKey:@"title"]];
    [self.showTime setText:[selectedItem objectForKey:@"showtimes"]];
    [self.movieRating setText:[selectedItem objectForKey:@"rating"]];
    [self.movieThumbnail setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[selectedItem objectForKey:@"thumbnail"] ofType:@"png" inDirectory:@"images"]]];
    
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:[selectedItem valueForKey:@"trailer"] ofType:@"mp4" inDirectory:@"movies"];
    
    NSLog(@"videoPath %@", videoPath);
    NSLog(@"selectedItem %@", selectedItem);
    NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
    NSLog(@"videoURL %@", videoURL);
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    if (moviePlayer != nil)
    {
        [videoView addSubview:moviePlayer.view];
        moviePlayer.view.frame = videoView.bounds;
        moviePlayer.fullscreen = false;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
        moviePlayer.shouldAutoplay = NO;
    }
    
    [moviePlayer play];
    
}

- (IBAction)onStop:(id)sender
{
    if (moviePlayer != nil)
    {
        [moviePlayer stop];
    }
}

- (void)viewDidUnload
{
    [self setMovieTitle: nil];
    [self setShowTime:nil];
    [self setMovieRating:nil];
    [self setMovieThumbnail:nil];
    [self setVideoView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController  *destination = segue.destinationViewController;
    if([destination respondsToSelector:@selector(setDelegate:)])
    {
        [destination setValue:self forKey:@"delegate"];
    }
    if ([destination respondsToSelector:@selector(setSelectedItem:)])
    {
        [destination setValue:selectedItem forKey:@"selectedItem"];
    }
}

@end