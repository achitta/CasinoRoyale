//
//  BlackjackViewController.swift
//  Casino
//
//  Created by Aditya Chitta on 7/31/19.
//  Copyright © 2019 Aditya Chitta. All rights reserved.
//

import UIKit

class BlackjackViewController: UIViewController {

    var my_deck = Deck()
    var dealer = User()
    var player = User()
    var betStack = Stack()
    
    var d_count = 0
    var p_count = 0
    var d_arr : [UIImageView] = []
    var p_arr : [UIImageView] = []
    
    var bet_made_flag = false
    var bet_pressed_flag = false
    
    @IBOutlet weak var d1: UIImageView!
    @IBOutlet weak var d2: UIImageView!
    @IBOutlet weak var d3: UIImageView!
    @IBOutlet weak var d4: UIImageView!
    @IBOutlet weak var d5: UIImageView!
    
    @IBOutlet weak var p1: UIImageView!
    @IBOutlet weak var p2: UIImageView!
    @IBOutlet weak var p3: UIImageView!
    @IBOutlet weak var p4: UIImageView!
    @IBOutlet weak var p5: UIImageView!
    
    
    @IBOutlet weak var bet_amount_ui: UILabel!
    @IBOutlet weak var remaining_money_ui: UILabel!
    
    @IBOutlet weak var Dealer_Score_UI: UILabel!
    @IBOutlet weak var Player_Low_Score_UI: UILabel!
    @IBOutlet weak var Player_High_Score_UI: UILabel!
    @IBOutlet weak var Slash_UI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        d_arr.append(self.d1)
        d_arr.append(self.d2)
        d_arr.append(self.d3)
        d_arr.append(self.d4)
        d_arr.append(self.d5)
        
        p_arr.append(self.p1)
        p_arr.append(self.p2)
        p_arr.append(self.p3)
        p_arr.append(self.p4)
        p_arr.append(self.p5)
        
        for index in 0...4 {
            d_arr[index].isHidden = true
            p_arr[index].isHidden = true
        }
        
        Dealer_Score_UI.isHidden = true;
        Player_Low_Score_UI.isHidden = true;
        Player_High_Score_UI.isHidden = true;
        Slash_UI.isHidden = true;
    }
    
    
    @IBAction func ten_pressed(_ sender: Any) {
        if(player.money_remaining < 10) {
            return
        }
        if(bet_pressed_flag) {
            print("Can't bet after locking it in")
            return
        }
        player.bet_amount += 10
        player.money_remaining -= 10
        bet_made_flag = true
        bet_amount_ui.text = "\(player.bet_amount)"
        remaining_money_ui.text = "\(player.money_remaining)"
        betStack.push(10)
    }
    
    @IBAction func twenty_pressed(_ sender: Any) {
        if(player.money_remaining < 20) {
            return
        }
        if(bet_pressed_flag) {
            print("Can't bet after locking it in")
            return
        }
        player.bet_amount += 20
        player.money_remaining -= 20
        bet_made_flag = true
        bet_amount_ui.text = "\(player.bet_amount)"
        remaining_money_ui.text = "\(player.money_remaining)"
        betStack.push(20)
    }
    
    @IBAction func fifty_pressed(_ sender: Any) {
        if(player.money_remaining < 50) {
            return
        }
        if(bet_pressed_flag) {
            print("Can't bet after locking it in")
            return
        }
        player.bet_amount += 50
        player.money_remaining -= 50
        bet_made_flag = true
        bet_amount_ui.text = "\(player.bet_amount)"
        remaining_money_ui.text = "\(player.money_remaining)"
        betStack.push(50)
    }
    
    @IBAction func hundred_pressed(_ sender: Any) {
        if(player.money_remaining < 100) {
            return
        }
        if(bet_pressed_flag) {
            print("Can't bet after locking it in")
            return
        }
        player.bet_amount += 100
        player.money_remaining -= 100
        bet_made_flag = true
        bet_amount_ui.text = "\(player.bet_amount)"
        remaining_money_ui.text = "\(player.money_remaining)"
        betStack.push(100)
    }
    
    @IBAction func all_in_pressed(_ sender: Any) {
        player.bet_amount = player.money_remaining
        betStack.push(player.bet_amount)
        player.money_remaining = 0
        bet_made_flag = true
        bet_amount_ui.text = "\(player.bet_amount)"
        remaining_money_ui.text = "\(player.money_remaining)"
        if(player.bet_amount == 0) {
            print("Please make a bet")
            return
        }
        if(bet_pressed_flag) {
            print("Can't bet after locking it in")
            return
        }
        //        player.bet_amount = 0
        bet_pressed_flag = true
        deal_cards()
    }
    
    func deal_cards() {
        let player_card_1 = my_deck.Hit()
        let dealer_show_card = my_deck.Hit()
        let player_card_2 = my_deck.Hit()
        let dealer_noshow_card = my_deck.Hit()
        
        player.add_card(player_card_1)
        player.add_card(player_card_2)
        dealer.add_card(dealer_show_card)
        display_dealer_counts()
        
        dealer.add_card(dealer_noshow_card)
        display_player_counts()
        dealer.print_hand()
        player.print_hand()
        
        display_dealer_card(dealer_show_card, d_count)
        d_count+=1
        d_arr[d_count].isHidden = false
        
        display_player_card(player_card_1, p_count)
        p_count+=1
        display_player_card(player_card_2, p_count)
        p_count+=1
        
        if(player.high_score == 21) {
            print("BLACKJACK!")
            player.money_remaining += Int(floor(Double(player.bet_amount) * 1.5))
            DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
                self.reset_all()
            }
        }
    }
    
    @IBAction func deal_pressed(_ sender: Any) {
        if(player.bet_amount == 0) {
            print("Please make a bet")
            return
        }
        if(bet_pressed_flag) {
            print("Can't bet after locking it in")
            return
        }
        //        player.bet_amount = 0
        bet_pressed_flag = true
        deal_cards()
    }
    
    func reset_all() {
        if(player.money_remaining <= 0) {
            print("YOU LOSE")
        }
        print("Reset All")
        bet_made_flag = false
        bet_pressed_flag = false
        d_count = 0
        p_count = 0
        for index in 0...4 {
            d_arr[index].image = UIImage(named: "backside")
            d_arr[index].isHidden = true
            p_arr[index].image = UIImage(named: "backside")
            p_arr[index].isHidden = true
        }
        Player_Low_Score_UI.isHidden = true
        Player_High_Score_UI.isHidden = true
        Slash_UI.isHidden = true
        Dealer_Score_UI.isHidden = true
        player.reset_user()
        dealer.reset_user()
        my_deck.reset()
        bet_amount_ui.text = "\(player.bet_amount)"
        remaining_money_ui.text = "\(player.money_remaining)"
        betStack.pop_all()
    }
    
    func check_player_bust() {
        player.calculate_scores()
        if(player.low_score > 21) {
            print("BUST!")
            DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
                self.reset_all()
            }
        }
    }
    
    @IBAction func hit_pressed(_ sender: Any) {
        let c1 = my_deck.Hit()
        player.add_card(c1)
        player.calculate_scores()
        display_player_card(c1, p_count)
        p_count+=1
        check_player_bust()
        display_player_counts()
    }
    
    @IBAction func stand_pressed(_ sender: Any) {
        d_arr[d_count].image = UIImage(named: "\(dealer.hand[1].getRank())\(dealer.hand[1].getSuit())")
        d_count+=1
        while(dealer.dealer_score < 17) {
            print("Dealer Hit")
            let c1 = my_deck.Hit()
            dealer.add_card(c1)
            dealer.calculate_scores()
            display_dealer_counts()
            display_dealer_card(c1, d_count)
            d_count+=1
        }
        compare_dealer_and_player()
    }
    
    func compare_dealer_and_player() {
        print("Compare")
        print("Init Money: \(player.money_remaining)")
        print("Init Bet: \(player.bet_amount)")
        var player_score = player.high_score
        if(player.high_score > 21) {
            player_score = player.low_score
        }
        let dealer_score = dealer.dealer_score
        
        if(player_score > dealer_score || dealer_score > 21) {
            player.money_remaining += (player.bet_amount + player.bet_amount)
        }
        else if(player_score == dealer_score) {
            player.money_remaining += (player.bet_amount)
        }
        print("Final Money: \(player.money_remaining)")
        print("Final Bet: \(player.bet_amount)")
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
            self.reset_all()
        }
        
    }
    
    func display_dealer_card(_ show_card: Card, _ arr_index: Int) {
        d_arr[arr_index].image = UIImage(named: "\(show_card.getRank())\(show_card.getSuit())")
        d_arr[arr_index].isHidden = false;
    }
    
    func display_player_card(_ show_card: Card, _ arr_index: Int) {
        p_arr[arr_index].image = UIImage(named: "\(show_card.getRank())\(show_card.getSuit())")
        p_arr[arr_index].isHidden = false;
    }
    
    func display_player_counts() {
        player.calculate_scores()
        Player_Low_Score_UI.text = "\(player.low_score)"
        Player_High_Score_UI.text = "\(player.high_score)"
        Player_High_Score_UI.isHidden = false;
        Player_Low_Score_UI.isHidden = false;
        Slash_UI.isHidden = false;
    }
    
    func display_dealer_counts() {
        dealer.calculate_scores()
        Dealer_Score_UI.text = "\(dealer.dealer_score)"
        Dealer_Score_UI.isHidden = false;
    }
    
    @IBAction func undo_pressed(_ sender: Any) {
        if(betStack.isEmpty()) {
            return
        }
        let temp = betStack.top()
        betStack.pop()
        player.bet_amount -= temp
        player.money_remaining += temp
        bet_amount_ui.text = "\(player.bet_amount)"
        remaining_money_ui.text = "\(player.money_remaining)"
        if(betStack.isEmpty()) {
            bet_made_flag = false
        }
    }
    
//    @IBOutlet weak var remaining_money_ui: UILabel!
//    @IBOutlet weak var bet_amount_ui: UILabel!
//
//    @IBOutlet weak var d1: UIImageView!
//    @IBOutlet weak var d2: UIImageView!
//    @IBOutlet weak var d3: UIImageView!
//    @IBOutlet weak var d4: UIImageView!
//    @IBOutlet weak var d5: UIImageView!
//
//    @IBOutlet weak var p1: UIImageView!
//    @IBOutlet weak var p2: UIImageView!
//    @IBOutlet weak var p3: UIImageView!
//    @IBOutlet weak var p4: UIImageView!
//    @IBOutlet weak var p5: UIImageView!
//
//    @IBOutlet weak var Dealer_Score_UI: UILabel!
//    @IBOutlet weak var Player_Low_Score_UI: UILabel!
//
//    @IBOutlet weak var Slash_UI: UILabel!
//    @IBOutlet weak var Player_High_Score_UI: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func ten_pressed(_ sender: Any) {
//    }
//
//    @IBAction func twenty_pressed(_ sender: Any) {
//    }
//
//    @IBAction func fifty_pressed(_ sender: Any) {
//    }
//
//    @IBAction func hundred_pressed(_ sender: Any) {
//    }
//
//    @IBAction func deal_pressed(_ sender: Any) {
//    }
//
//    @IBAction func all_in_pressed(_ sender: Any) {
//    }
//
//    @IBAction func hit_pressed(_ sender: Any) {
//    }
//
//    @IBAction func stand_pressed(_ sender: Any) {
//    }
//    @IBAction func undo_pressed(_ sender: Any) {
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
