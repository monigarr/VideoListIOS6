//
//  MovieTableCell.h
//  mdf2_project4_final
//
//  Created by Monica Peters on 1/28/13.
//  Copyright (c) 2013 Monica Peters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *movieTitle;
@property (strong, nonatomic) IBOutlet UILabel *showTime;
@property (strong, nonatomic) IBOutlet UILabel *movieRating;
@property (strong, nonatomic) IBOutlet UIImageView *movieThumbnail;
@end
