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
    
    // Date Picker
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateButtonState()
        createDatePicker()
    }
    
    // Method for DatePicker
    private func createDatePicker(){
        // toolbar
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 44.0)))
        toolbar.sizeToFit()
        
        // bar done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        // assign toolbar
        dateTextField.inputAccessoryView = toolbar
        
        // assign date picker to the text field
        dateTextField.inputView = datePicker
        
        // Date picker mode
        datePicker.datePickerMode = .date
        
        // Wheel style
        if #available(iOS 13.4, *)  {
        datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    //
    @objc private func donePressed(){
        
        // Formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    // Method for updating interface
    private func updateUI(){
        emojiTextField.text = meal.emoji
        mealTextField.text = meal.meal
        dateTextField.text = meal.date
    }
    
    // Method for checking if text field has some text
    private func updateButtonState(){
        let emojiTextField = emojiTextField.text ?? ""
        let mealTextField = mealTextField.text ?? ""
       // let dateTextField = dateTextField.text ?? "9"
        
        saveButton.isEnabled = !emojiTextField.isEmpty && !mealTextField.isEmpty
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
