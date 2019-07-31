//
//  war_user.swift
//  Casino
//
//  Created by Aditya Chitta on 7/31/19.
//  Copyright © 2019 Aditya Chitta. All rights reserved.
//

import Foundation

class War_User {
    var hand : [War_Card] = []
    
    func add_card(_ newCard: War_Card) {
        hand.append(newCard);
    }
    
    func remove_card() {
        hand.remove(at: 0)
    }
    
    func play_card() -> War_Card{
        let temp = hand[0]
        remove_card()
        return temp
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
}

