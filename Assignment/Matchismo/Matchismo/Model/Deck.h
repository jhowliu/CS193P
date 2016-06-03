//
//  Deck.h
//  Matchismo
//
//  Created by jhow on 5/30/16.
//  Copyright © 2016 moewdev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
