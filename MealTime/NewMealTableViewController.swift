//
//  NewMealTableViewController.swift
//  MealTime
//
//  Created by Daniyar Mussin on 03.06.2021.
//

import UIKit

class NewMealTableViewController: UITableViewController {

    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var mealTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func textChanged(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
