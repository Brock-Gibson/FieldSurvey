//
//  FieldSurveyDetailViewController.swift
//  FieldSurvey
//
//  Created by Brock Gibson on 11/13/18.
//  Copyright © 2018 Brock Gibson. All rights reserved.
//

import UIKit

class FieldSurveyDetailViewController: UIViewController {
    
    var fieldSurvey: Observation?
    let dateFormatter = DateFormatter()


    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        self.title = "Observations"
        
        nameLabel.text = fieldSurvey?.title
        descTextField.text = fieldSurvey?.description
        dateLabel.text = dateFormatter.string(from: fieldSurvey!.date)
        iconImageView.image = fieldSurvey?.classification.image
    }

}
