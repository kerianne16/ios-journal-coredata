//
//  EntryDetailViewController.swift
//  CoreDataJournal
//
//  Created by Keri Levesque on 2/24/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit
import CoreData

class EntryDetailViewController: UIViewController {
    //MARK: Oulets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var entryTextView: UITextView!
  
    //MARK: Properties
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    var entryController: EntryController?
    
    func updateViews() {
        guard isViewLoaded else { return }
        
        titleTextField.text = entry?.title
        entryTextView.text = entry?.bodyText
    }
  
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTextView.text = ""
    }
    
 //MARK: Actions
    
    @IBAction func saveButton(_ sender: Any) {
      guard let entryController = entryController,
            let entryTitle = titleTextField.text,
            let bodyText = entryTextView.text
        else { return }

            if let entry = entry {
                entryController.update(entry: entry, newTitle: entryTitle, newBodyText: bodyText)
        } else {
                entryController.create(title: entryTitle, timestamp: Date(), bodyText: bodyText, identifier: "")
        }
    navigationController?.popViewController(animated: true)
    }
}
