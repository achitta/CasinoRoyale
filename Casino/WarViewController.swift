//
//  WarViewController.swift
//  Casino
//
//  Created by Aditya Chitta on 7/31/19.
//  Copyright © 2019 Aditya Chitta. All rights reserved.
//

import UIKit

class WarViewController: UIViewController {
    var p1 = War_User();
    var p2 = War_User();
    var my_deck = War_Deck()
    
    
    @IBOutlet weak var p1CardImage: UIImageView!
    @IBOutlet weak var p2CardImage: UIImageView!
    
    @IBOutlet weak var p1NumCards: UILabel!
    @IBOutlet weak var p2NumCards: UILabel!
    
    
    func dealCards() {
        while(!(my_deck.empty())) {
            let c1 = my_deck.dealOne()
            let c2 = my_deck.dealOne()
            p1.add_card(c1)
            p2.add_card(c2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        my_deck.my_shuffle()
        dealCards()
        p1NumCards.text = "\(p1.hand_size())"
        p2NumCards.text = "\(p2.hand_size())"
    }
    
    
    @IBAction func showPressed(_ sender: Any) {
        var pot : [War_Card] = []
        while(true) {
            let card1 = p1.play_card()
            let card2 = p2.play_card()
            pot.append(card1)
            pot.append(card2)
            var rank_str_1 = String(card1.getRank())
            var rank_str_2 = String(card2.getRank())
            if(rank_str_1 == "11") {
                rank_str_1 = "J"
            }
            else if(rank_str_1 == "12") {
                rank_str_1 = "Q"
            }
            else if(rank_str_1 == "13") {
                rank_str_1 = "K"
            }
            else if(rank_str_1 == "14") {
                rank_str_1 = "A"
            }
            
            if(rank_str_2 == "11") {
                rank_str_2 = "J"
            }
            else if(rank_str_2 == "12") {
                rank_str_2 = "Q"
            }
            else if(rank_str_2 == "13") {
                rank_str_2 = "K"
            }
            else if(rank_str_2 == "14") {
                rank_str_2 = "A"
            }
            
            let suit_str_1 = card1.getSuit()
            let suit_str_2 = card2.getSuit()
            
            p1CardImage.image = UIImage(named: "\(rank_str_1)\(suit_str_1)")
            
            p2CardImage.image = UIImage(named: "\(rank_str_2)\(suit_str_2)")
            
            if(lessThan(card1, card2)) {
                for card in pot {
                    p2.add_card(card)
                }
                break;
            }
            else if(lessThan(card2, card1)) {
                for card in pot {
                    p1.add_card(card)
                }
                break;
            }
            else {
                if(p1.empty_hand() || p2.empty_hand()) {
                    break;
                }
            }
        }
        p1NumCards.text = "\(p1.hand_size())"
        p2NumCards.text = "\(p2.hand_size())"
        p1.hand.shuffle()
        p2.hand.shuffle()
        if(p1.hand_size() == 0 || p2.hand_size() == 0) {
            p1.hand.removeAll()
            p2.hand.removeAll()
            my_deck.reset()
            my_deck.my_shuffle()
            dealCards()
            p1NumCards.text = "\(p1.hand_size())"
            p2NumCards.text = "\(p2.hand_size())"
        }
    }
//    @IBOutlet weak var p1CardImage: UIImageView!
//    @IBOutlet weak var p2CardImage: UIImageView!
//    @IBOutlet weak var p1NumCards: UILabel!
//    @IBOutlet weak var p2NumCards: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func showPressed(_ sender: Any) {
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
