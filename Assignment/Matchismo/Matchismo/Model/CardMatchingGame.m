//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by jhow on 6/1/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite)  NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

#define MISMATCH_PENALTY 4
#define COST_TO_CHOOSE 1
#define MATCH_BONUS 2

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self.cards objectAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *anotherCard in self.cards) {
                if (anotherCard.isChosen && !anotherCard.isMatched) {
                    int matchScore = [card match:@[anotherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        anotherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        anotherCard.chosen = NO;
                    }
                    break; // Only choose the two cards right now
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? [self.cards objectAtIndex:index] : nil;
}

@end
