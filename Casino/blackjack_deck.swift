//
//  blackjack_deck.swift
//  Casino
//
//  Created by Aditya Chitta on 7/31/19.
//  Copyright © 2019 Aditya Chitta. All rights reserved.
//

import Foundation

class Deck {
    let DECK_SIZE = 192
    var cards : [Card] = []
    var next = 0;
    
    init() {
        for _ in 1...4 {
            for suit in SUIT_BY_WEIGHT {
                for rank in RANK_BY_WEIGHT {
                    let c1 = Card(rank,suit)
                    self.cards.append(c1)
                }
            }
        }
        my_shuffle();
    }
    
    func Hit() -> Card{
        print("Next: \(next)")
        next += 1
        return cards[next-1]
    }
    
    func my_shuffle() {
        let random_num = Int.random(in: 1...10)
        for _ in 1...random_num {
            cards.shuffle()
        }
    }
    
    func reset() {
        next = 0;
        cards.removeAll()
        for _ in 1...4 {
            for suit in SUIT_BY_WEIGHT {
                for rank in RANK_BY_WEIGHT {
                    let c1 = Card(rank,suit)
                    self.cards.append(c1)
                }
            }
        }
        my_shuffle()
    }
}
