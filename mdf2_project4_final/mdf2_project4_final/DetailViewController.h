//
//  DetailViewController.h
//  mdf2_project4_final
//
//  Created by Monica Peters on 1/28/13.
//  Copyright (c) 2013 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AppDelegate.h"

@interface DetailViewController : UIViewController
{
    MPMoviePlayerController *moviePlayer;
}

@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *showTime;
@property (strong, nonatomic) IBOutlet UILabel *movieRating;
@property (strong, nonatomic) IBOutlet UIImageView *movieThumbnail;
@property (strong, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) NSDictionary *selectedItem;

- (IBAction)onPlay:(id)sender;
- (IBAction)onStop:(id)sender;

@end

