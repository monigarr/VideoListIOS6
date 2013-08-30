//
//  MovieData.h
//  mdf2_project4_final
//
//  Created by Monica Peters on 1/28/13.
//  Copyright (c) 2013 Monica Peters. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieData : NSObject

@property (nonatomic, strong) NSDictionary *theaters;
-(MovieData *) init;
-(NSDictionary *)getMovies;

@end
