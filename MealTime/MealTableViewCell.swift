//
//  MealTableViewCell.swift
//  MealTime
//
//  Created by Daniyar Mussin on 03.06.2021.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(object: Meal) {
        self.emojiLabel.text = object.emoji
        self.mealLabel.text = object.meal
        self.dateLabel.text = object.date
    }

}
