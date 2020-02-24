//
//  EntryController.swift
//  CoreDataJournal
//
//  Created by Keri Levesque on 2/24/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    var entries: [Entry] {
           loadFromPersistentStore()
       }
//MARK: Persistance
       func saveToPersistentStore() {
           do {
               let entry = CoreDataStack.shared.mainContext
               try entry.save()
           } catch {
               print("Error saving managed object context: \(error)")
           }
       }
       
       func loadFromPersistentStore() -> [Entry] {
           let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
           let entry = CoreDataStack.shared.mainContext
           do {
               return try entry.fetch(fetchRequest)
           } catch {
               print("Error fetching entries: \(error)")
               return []
           }
       }
//MARK: CRUD methods
       func create(title: String, timestamp: Date, bodyText: String?, identifier: String) {
        let _ = Entry(title: title, bodyText: bodyText, timestamp: timestamp, identifier: identifier)
           saveToPersistentStore()
       }

       func update(entry: Entry, newTitle: String, newBodyText: String) {
           entry.title = newTitle
           entry.bodyText = newBodyText
           entry.timestamp = Date()
           saveToPersistentStore()
       }

       func delete(entry: Entry) {
           let entr = CoreDataStack.shared.mainContext
           entr.delete(entry)
           do {
               try entr.save()
           } catch {
               entr.reset()
               print("Error saving managed object context: \(error)")
           }
       }
    
    
    
}
