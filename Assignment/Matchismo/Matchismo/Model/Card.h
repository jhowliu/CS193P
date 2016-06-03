//
//  Card.h
//  Matchismo
//
//  Created by jhow on 5/30/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match: (NSArray *)othercards;

@end