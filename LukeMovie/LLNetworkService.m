//
//  LLNetworkService.m
//  LukeMovie
//
//  Created by Luke Lu on 13-8-17.
//  Copyright (c) 2013年 www.lukelu.org. All rights reserved.
//

#import "LLNetworkService.h"

@implementation LLNetworkService

+ (id)parseData:(NSString *)name
{
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path = [resourcePath stringByAppendingPathComponent:name];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:Nil];
    return result;
}

+ (id)testData
{
    return [self parseData:@"test.json"];
}

+ (id)northUSAData
{
    return [[self parseData:@"NorthUSA.json"] objectForKey:@"subjects"];
}

+ (id)newsData
{
    return [self parseData:@"news_list.json"];
}

+ (id)topMovieData
{
    return [[self parseData:@"movie_list.json"] objectForKey:@"entries"];
}

+ (id)cinemaData
{
    return [self parseData:@"readyMovie.json"];
}

+ (id)newsImageData
{
    return [self parseData:@"news_detail_images.json"];
}

+ (id)movieInfoData
{
    return [self parseData:@"movie_detail.json"];
}

+ (id)movieCommentData
{
    return [[self parseData:@"movie_comment.json"] objectForKey:@"list"];
}

@end
