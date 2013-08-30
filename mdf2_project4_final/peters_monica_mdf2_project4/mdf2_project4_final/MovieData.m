//
//  MovieData.m
//  mdf2_project4_final
//
//  Created by Monica Peters on 1/28/13.
//  Copyright (c) 2013 Monica Peters. All rights reserved.
//

#import "MovieData.h"

@implementation MovieData
@synthesize theaters;

-(MovieData *) init
{
    self = [super init];
    theaters = [self getMovies];
    return self;
}

-(NSDictionary *)getMovies
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"movies" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"dict %@", dict);
    return dict;
}
@end
