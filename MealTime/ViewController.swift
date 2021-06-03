//
//  ViewController.swift
//  MealTime
//
//  Created by Daniyar Mussin on 03.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // array for datas
    var array = [Date]()
    
    // formating date
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // adding new row to table view
        let date = Date()
        array.append(date)
        print("date added")
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

}
   // MARK: - UITableViewDataSource
   
    extension ViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "My happy meal time"
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            
            let date = array[indexPath.row]
            
            cell!.textLabel!.text = dateFormatter.string(from: date)
            return cell!
        }
    }


