//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Nataliia Koldaeva on 3/18/15.
//  Copyright (c) 2015 Nataliia Koldaeva. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerDelegate {
    func saveNote(controller: AddNoteViewController, noteText: String)
}

class AddNoteViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var ourTextField: UITextField?
    
    var delegate: AddNoteViewControllerDelegate?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("Text entered is: \(textField.text)")
        
        delegate?.saveNote(self, noteText: textField.text)
        
        return true
    }
    
    @IBAction func closeAddNote(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
