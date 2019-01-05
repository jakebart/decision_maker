//
//  ViewController.swift
//  Decision Maker
//
//  Created by Jacob Barth on 1/3/19.
//  Copyright © 2019 Jacob Barth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label_genies.isHidden = true
        decision_label.isHidden = true
        reset.isHidden = true
        //Sets padding in textfeilds
        first_choice.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
        second_choice.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
        //Hides keyyboard
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    //resets view and variables
    func reset_func() {
        reset.isHidden = true
        label_genies.isHidden = true
        decision_label.isHidden = true
        
        make_choice.isHidden = false
    }
    //shows view for when choice is made
    func show_choice() {
        label_genies.isHidden = false
        decision_label.isHidden = false
        reset.isHidden = false
        make_choice.isHidden = true
    }
    //Hiding keyboard function
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //input feilds
    @IBOutlet weak var first_choice: UITextField!
    @IBOutlet weak var second_choice: UITextField!
    
    //other labels and buttons
    @IBOutlet weak var label_genies: UILabel!
    
    @IBOutlet weak var make_choice: UIButton!
    @IBOutlet weak var decision_label: UILabel!
    @IBOutlet weak var reset: UIButton!
    //when make decision button is tapped
    @IBAction func make_a_decision(_ sender:Any) {
        let first_choice_input: String = first_choice.text ?? ""
        let second_choice_input: String = second_choice.text ?? ""
        let rand_int = Int(arc4random_uniform(2))
        print(rand_int)
        if (rand_int == 1 || rand_int == 2) {
            decision_label.text = second_choice_input
        } else {
            decision_label.text = first_choice_input
        }
        self.view.endEditing(true)
        show_choice()
        }
    //resets view
    @IBAction func reset_btn(_ sender: Any) {
        first_choice.text = ""
        second_choice.text = ""
        reset_func()
    }
    //Hides keyboard when a tap is registered outside textfeild
    @IBAction func cancel_keyboard(_ sender: Any) {
        hideKeyboardWhenTappedAround()
    }
}
