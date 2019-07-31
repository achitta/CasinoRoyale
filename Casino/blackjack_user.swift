//
//  blackjack_user.swift
//  Casino
//
//  Created by Aditya Chitta on 7/31/19.
//  Copyright © 2019 Aditya Chitta. All rights reserved.
//

import Foundation

class User {
    var hand : [Card] = []
    var low_score = 0
    var high_score = 0
    var dealer_score = 0
    var money_remaining = 1000
    var bet_amount = 0
    
    func add_card(_ newCard: Card) {
        hand.append(newCard);
    }
    
    func empty_hand() -> Bool {
        if(hand.count == 0) {
            return true;
        }
        return false;
    }
    
    func hand_size() -> Int {
        return hand.count;
    }
    
    func reset_user() {
        low_score = 0
        high_score = 0
        bet_amount = 0
        hand.removeAll()
    }
    
    func calculate_scores() {
        var ace_flag = false
        var low_count = 0
        var high_count = 0
        for cards in hand {
            if(cards.getScore() == -1) {
                if(!ace_flag) {
                    ace_flag = true
                    low_count += 1
                    high_count += 11
                }
                else {
                    low_count+=1
                    high_count+=1
                }
            }
            else {
                low_count += cards.getScore()
                high_count += cards.getScore()
            }
        }
        low_score = low_count
        high_score = high_count
        
        if(high_count < 21) {
            dealer_score = high_count;
        }
        else {
            dealer_score = low_count;
        }
    }
    
    //    func dealer_calculate_scores() {
    //        var ace_flag = false
    //        var low_count = 0
    //        var high_count = 0
    //        for cards in hand {
    //            if(cards.getScore() == -1) {
    //                if(!ace_flag) {
    //                    ace_flag = true
    //                    low_count += 1
    //                    high_count += 11
    //                }
    //                low_count+=1
    //                high_count+=1
    //            }
    //            else {
    //                low_count += cards.getScore()
    //                high_count += cards.getScore()
    //            }
    //        }
    //        if(high_count < 21) {
    //            dealer_score = high_count;
    //        }
    //        else {
    //            dealer_score = low_count;
    //        }
    //    }
    
    func print_hand() {
        for cards in hand {
            printCard(cards)
        }
    }
}
