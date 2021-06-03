//
//  NewMealTableViewController.swift
//  MealTime
//
//  Created by Daniyar Mussin on 03.06.2021.
//

import UIKit

class NewMealTableViewController: UITableViewController {
    
    var meal = Meal(emoji: "", meal: "", date: "", isFavorite: false)
    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var mealTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func textChanged(_ sender: Any) {
        updateButtonState()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateButtonState()
        
    }
    
    // Method for updating interface
    private func updateUI(){
        emojiTextField.text = meal.emoji
        mealTextField.text = meal.meal
        dateTextField.text = meal.date
    }
    
    // Method for checking if text field has some text
    private func updateButtonState(){
        let emojiTextField = emojiTextField.text ?? "9"
        let mealTextField = mealTextField.text ?? "9"
        let dateTextField = dateTextField.text ?? "9"
        
        saveButton.isEnabled = !emojiTextField.isEmpty && !mealTextField.isEmpty && !dateTextField.isEmpty
    }
    
    // Method will run when we will exit second screen back to first
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        // values from text field sending to object meal
        let emoji = emojiTextField.text ?? "0"
        let meal = mealTextField.text ?? "0"
        let date = dateTextField.text ?? "0"
        
        self.meal = Meal(emoji: emoji, meal: meal, date: date, isFavorite: self.meal.isFavorite)
    }
}
