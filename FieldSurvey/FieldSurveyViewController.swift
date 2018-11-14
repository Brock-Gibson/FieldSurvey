//
//  FieldSurveyViewController.swift
//  FieldSurvey
//
//  Created by Brock Gibson on 11/13/18.
//  Copyright © 2018 Brock Gibson. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let jsonFileName = "field_observations"
    
    @IBOutlet weak var fieldSurveyTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var observationSet: FieldObservationSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium

        observationSet = FieldObservationLoader.load(jsonFileName: jsonFileName)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (observationSet?.observations.count)!
    }
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FieldSurveyTableCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell {
            let fieldSurveys = observationSet?.observations[indexPath.row]
            cell.nameLabel.text = fieldSurveys?.title
            cell.dateLabel.text = dateFormatter.string(from: fieldSurveys!.date)
            cell.iconImageView.image = fieldSurveys?.classification.image
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController,
            let row = fieldSurveyTableView.indexPathForSelectedRow?.row {
                destination.fieldSurvey = observationSet?.observations[row]
        }
    }

}
