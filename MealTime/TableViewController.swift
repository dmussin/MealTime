//
//  TableViewController.swift
//  MealTime
//
//  Created by Daniyar Mussin on 03.06.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    // Get the current date and time
    let currentDateTime = Date()

    // Initialize the date formatter and set the stylelet date = Date()
//    let formatter = DateFormatter()
//    formatter.timeStyle = .short
//    let dateString = formatter.string(from: currentDateTime)
//
    
    // Array for objects
    var objects = [Meal(emoji: "🍤", meal: "Shrimps", date: "Date: ", isFavorite: false),
    Meal(emoji: "🍤", meal: "Shrimps", date: "Date: ", isFavorite: false),
    Meal(emoji: "🍤", meal: "Shrimps", date: "Date: ", isFavorite: false)]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation button - EDIT and color set up.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .systemOrange
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealTableViewCell

        let object = objects[indexPath.row] // getting an object by indexPath
        cell.set(object: object) // Confugurating in MealTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            // deleting object from array
            objects.remove(at: indexPath.row)
            // deleting from table
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // moving the object
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Method for saving the movement of the objects
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedMeal = objects.remove(at: sourceIndexPath.row)
        objects.insert(movedMeal, at: destinationIndexPath.row)
        tableView.reloadData()
    }

}
