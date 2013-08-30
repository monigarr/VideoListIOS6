//
//  AppDelegate.h
//  mdf2_project4_final
//
//  Created by Monica Peters on 1/28/13.
//  Copyright (c) 2013 Monica Peters. All rights reserved.
//
//  blue folders vs yellow folders
//  http://stackoverflow.com/questions/13346247/xcode-project-navigator-difference-between-yellow-folder-and-blue-folder
//  copy bundle resources in project settings for the images and movies.

#import <UIKit/UIKit.h>
#import "MovieData.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MovieData *movieList;

-(MovieData *)createDataInstance;
@end
