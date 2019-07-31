//
//  blackjack_card.swift
//  Casino
//
//  Created by Aditya Chitta on 7/31/19.
//  Copyright © 2019 Aditya Chitta. All rights reserved.
//

import Foundation

//Added these aliases to make it easier to remember names of variables later
//The reason behind making the rank a string is that it is easier to display
//the cards for the UI
let RANK_TWO = "2"
let RANK_THREE = "3"
let RANK_FOUR = "4"
let RANK_FIVE = "5"
let RANK_SIX = "6"
let RANK_SEVEN = "7"
let RANK_EIGHT = "8"
let RANK_NINE = "9"
let RANK_TEN = "10"
let RANK_JACK = "J"
let RANK_QUEEN = "Q"
let RANK_KING = "K"
let RANK_ACE = "A"

//let SUIT_SPADES = "S"
//let SUIT_HEARTS = "H"
//let SUIT_CLUBS = "C"
//let SUIT_DIAMONDS = "D"

//Since rank is a string, we can use this array to find the weight of each card
// in blackjack
var RANK_BY_WEIGHT = [RANK_TWO, RANK_THREE, RANK_FOUR, RANK_FIVE, RANK_SIX, RANK_SEVEN, RANK_EIGHT, RANK_NINE, RANK_TEN, RANK_JACK, RANK_QUEEN, RANK_KING, RANK_ACE]

//Need this for initialization of decks of cards
//var SUIT_BY_WEIGHT = [SUIT_SPADES, SUIT_HEARTS, SUIT_CLUBS, SUIT_DIAMONDS]

class Card {
    var rank = "2"
    var suit = "Spades"
    
    init(_ rank: String, _ suit: String) {
        self.rank = rank;
        self.suit = suit;
    }
    
    func getRank() -> String {
        return rank;
    }
    
    func getSuit() -> String {
        return suit;
    }
    
    func getScore() -> Int {
        var score = -1;
        //Find the index in RANK_BY_WEIGHT that rank of the card corresponds to
        // and add 2 to it to get the score
        for index in 2...14 {
            if(rank == RANK_BY_WEIGHT[index-2]){
                score = index;
                break;
            }
        }
        //If the score is 14, then the card is an ACE so we need to treat this
        // as a special case
        if(score == 14) {
            return -1;
        }
            //If the score is greater than 10 but not 14, then we know it is a face
            // card so we return 10;
        else if(score > 10) {
            return 10;
        }
        //Otherwise, just return the calculated score (numbered cards)
        return score;
    }
}

//For debug purposes
func printCard(_ my_card: Card) {
    print(my_card.rank + " of " + my_card.suit)
}
