//
//  ViewController.h
//  mdf2_project4_final
//
//  Created by Monica Peters on 1/28/13.
//  Copyright (c) 2013 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AppDelegate.h"
#import "MovieData.h"
#import "DetailViewController.h"
#import "MovieTableCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    AppDelegate *appDelegate;
    MovieData *allMovies;
}

@property (strong, nonatomic) IBOutlet UITableView *theTableView;
@property (strong, nonatomic) NSDictionary *theaterList;
@property (strong, nonatomic) NSString *theaterName;
@property (strong, nonatomic) NSString *theaterAddress;
@property (strong, nonatomic) NSString *theaterImage;
@property (strong, nonatomic) NSString *movieTitle;
@property (strong, nonatomic) NSString *movieRating;
@property (strong, nonatomic) NSString *movieTimes;
@property (strong, nonatomic) NSString *movieThumbnail;
@property (strong, nonatomic) UIView *header;
@property (strong, nonatomic) UIView *footer;
@property (strong, nonatomic) UILabel *footerProjectLabel;
@property (strong, nonatomic) UILabel *theaterNameLabel;
@property (strong, nonatomic) UILabel *theaterAddressLabel;
@property (strong, nonatomic) UIImageView *theaterHeaderImage;

@end
