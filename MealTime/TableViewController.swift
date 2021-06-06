//
//  TableViewController.swift
//  MealTime
//
//  Created by Daniyar Mussin on 03.06.2021.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
   // Creating property for context CoreData
    var context: NSManagedObjectContext!
    
    // Array for objects
    var objects = [Meal(emoji: "❗️", meal: "Swipe right to give a like", date: "Date is optional", isFavorite: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation button - EDIT and color set up.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .systemOrange
        
    }
    
    
    // MARK: - Returning to main screen - unwind segue
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "saveSegue" else { return }
        // getting data from another controller
        let sourceVC = segue.source as! NewMealTableViewController
        let meal = sourceVC.meal
        
        // checking if selected cell is new
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            objects[selectedIndexPath.row] = meal
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            // newIndexPath
            let newIndexPath = IndexPath(row: objects.count, section: 0)
            // adding to object array
            objects.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .fade)
            print(objects.count)
        }
    }
    
    override func prepare(for seque: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: seque, sender: sender)
        guard seque.identifier == "editMeal" else { return }
        let indexPath = tableView.indexPathForSelectedRow
        let meal = objects[indexPath!.row]
        let navigationVC = seque.destination as! UINavigationController
        let newMealVC = navigationVC.topViewController as! NewMealTableViewController
        newMealVC.meal = meal
        newMealVC.title = "Edit"

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
    
    // Leading swipe Actions Custom
    override func tableView(_ tableView: UITableView,
                            leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       // let done = doneAction(at: indexPath) // done action
        let favourite = favourite(at: indexPath) // favourite action
        return UISwipeActionsConfiguration(actions: [favourite])
    }

    
    // Done action
//    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
//        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
////            self.objects.remove(at: indexPath.row)
////            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//            self.mealIndexToEdit = indexPath.row
//            self.performSegue(withIdentifier: "editMeal", sender: nil)
//
//
//            completion(true)
//        }
//        // customizing
//        action.backgroundColor = .systemOrange
//        action.image = UIImage(systemName: "edit")
//        return action
//    }
    
    // Favourite action
    func favourite(at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row] // getting object
        let action = UIContextualAction(style: .normal, title: "Favourite") { (action, view, completion) in
            object.isFavorite = !object.isFavorite // changing isFavorite to oposite value
            self.objects[indexPath.row] = object // changing object in array to the new one
            completion(true)
        }
        action.backgroundColor = object.isFavorite ? .systemPurple : .systemGray // changing the background color
        action.image = UIImage(systemName: "heart")
        return action
    }
    
    
}
