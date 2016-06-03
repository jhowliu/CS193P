//
//  PlayingCard.m
//  Matchismo
//
//  Created by jhow on 5/30/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

+ (NSArray *)validSuits {
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

+ (NSUInteger)maxRank {
    return [[self rankingStrings] count]-1;
}

+ (NSArray *)rankingStrings {
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (NSString *)contents {
    NSArray *rankingStrings = [PlayingCard rankingStrings];
    return [rankingStrings[self.rank] stringByAppendingString: self.suit];
}

@synthesize suit = _suit; // Because we provide getter and setter.

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}


// Override the match in the Card class
- (int)match:(NSArray *)othercards {
    PlayingCard *card = [othercards firstObject];
    int score = 0;
    
    if (card) {
        if (self.rank == card.rank) {
            score = 4;
        }
    }
    
    return score;
}

@end
