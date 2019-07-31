//
//  blackjack_stack.swift
//  Casino
//
//  Created by Aditya Chitta on 7/31/19.
//  Copyright © 2019 Aditya Chitta. All rights reserved.
//

import Foundation

class Stack {
    var arr : [Int] = []
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
    
    func push(_ my_int: Int) {
        arr.append(my_int)
    }
    
    func pop() {
        arr.removeLast()
    }
    
    func top() -> Int {
        return arr.last!
    }
    
    func pop_all() {
        arr.removeAll()
    }
}
