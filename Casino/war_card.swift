//
//  war_card.swift
//  Casino
//
//  Created by Aditya Chitta on 7/31/19.
//  Copyright © 2019 Aditya Chitta. All rights reserved.
//

import Foundation

let W_RANK_TWO = 2
let W_RANK_THREE = 3
let W_RANK_FOUR = 4
let W_RANK_FIVE = 5
let W_RANK_SIX = 6
let W_RANK_SEVEN = 7
let W_RANK_EIGHT = 8
let W_RANK_NINE = 9
let W_RANK_TEN = 10
let W_RANK_JACK = 11
let W_RANK_QUEEN = 12
let W_RANK_KING = 13
let W_RANK_ACE = 14

let SUIT_SPADES = "S"
let SUIT_HEARTS = "H"
let SUIT_CLUBS = "C"
let SUIT_DIAMONDS = "D"

var W_RANK_BY_WEIGHT = [W_RANK_TWO, W_RANK_THREE, W_RANK_FOUR, W_RANK_FIVE, W_RANK_SIX, W_RANK_SEVEN, W_RANK_EIGHT, W_RANK_NINE, W_RANK_TEN, W_RANK_JACK, W_RANK_QUEEN, W_RANK_KING, W_RANK_ACE]

var SUIT_BY_WEIGHT = [SUIT_SPADES, SUIT_HEARTS, SUIT_CLUBS, SUIT_DIAMONDS]

class War_Card {
    var rank = 2
    var suit = "Spades"
    
    init(_ rank: Int, _ suit: String) {
        self.rank = rank;
        self.suit = suit;
    }
    
    func getRank() -> Int {
        return rank;
    }
    
    func getSuit() -> String {
        return suit;
    }
    
    func printCard() {
        print(String(rank) + " of " + suit)
    }
}

func lessThan(_ Card1: War_Card, _ Card2: War_Card) -> Bool {
    return Card1.getRank() < Card2.getRank();
}

func equalTo(_ Card1: War_Card, _ Card2: War_Card) -> Bool {
    return Card1.getRank() == Card2.getRank();
}
