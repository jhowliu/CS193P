//
//  Card.m
//  Matchismo
//
//  Created by jhow on 5/30/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)othercards
{
    int score = 0;
   
    for (Card *card in othercards) {
        if ([card.contents isEqualToString: self.contents]) {
            score = 1;
        }
        
    }
    
    return score;
}

@end


