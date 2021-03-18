//
//  ViewController.swift
//  GithubPractice
//
//  Created by Vasile Vornic on 3/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var jobPositionField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var saveButton: HighlightButton!
    @IBOutlet weak var clearButton: HighlightButton!
    
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        jobPositionField.delegate = self
    }
    
    @IBAction func didClickSave(_ sender: Any) {
        defaults.set(firstNameField.text, forKey: "firstName")
        defaults.set(lastNameField.text, forKey: "lastName")
    }
    
    @IBAction func didClickClear(_ sender: Any) {
    }
}

// MARK: - UITextFieldDelegate extension

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

