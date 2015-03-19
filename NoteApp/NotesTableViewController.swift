//
//  NotesTableViewController.swift
//  NoteApp
//
//  Created by Nataliia Koldaeva on 3/18/15.
//  Copyright (c) 2015 Nataliia Koldaeva. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, AddNoteViewControllerDelegate {

    var notes: NSArray
    
    required init(coder aDecoder: NSCoder) {
        notes = ["one", "two", "three", "four", "five"]
        super.init(coder: aDecoder)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell") as UITableViewCell
        
        cell.textLabel?.text = notes[indexPath.row] as NSString
        return cell
    }
    
    func saveNote(controller: AddNoteViewController, noteText: String) {
        println("This is text entered in AddNoteViewController: \(noteText)")
        
        dismissViewControllerAnimated(true, completion: nil)
        
        var mutableNotes:NSMutableArray = NSMutableArray(array:notes)
        mutableNotes.addObject(noteText)
        notes = NSArray(array:mutableNotes)
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowAddNote") {
            let addNoteViewController = segue.destinationViewController as AddNoteViewController
            addNoteViewController.delegate = self
        }
    }
}
