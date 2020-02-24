//
//  EntryTableViewCell.swift
//  CoreDataJournal
//
//  Created by Keri Levesque on 2/24/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    
    //MARK: Outlets
    
    @IBOutlet weak var entryTitleLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    
    
    //MARK: Properties
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    //MARK: Methods
    func updateViews() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        
        entryTitleLabel.text = entry?.title
        timestampLabel.text = formatter.string(from: entry?.timestamp ?? Date())
        bodyTextLabel.text = entry?.bodyText
        
    }
}
