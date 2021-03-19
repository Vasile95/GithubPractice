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
    
    let firstNameKey = Constants.firstNameKey
    let lastNameKey = Constants.lastNameKey
    let jobKey = Constants.jobKey
    let birthDayKey = Constants.birthDayKey
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        jobPositionField.delegate = self
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        
        if let fisrtName = defaults.string(forKey: firstNameKey) {
            firstNameField.text = fisrtName
        }
        
        if let lastName = defaults.string(forKey: lastNameKey){
            lastNameField.text = lastName
        }
        
        if let job = defaults.string(forKey: jobKey) {
            jobPositionField.text = job
        }

        if let date = defaults.object(forKey: birthDayKey) as? Date{
            birthdayPicker.date = date
        }
    }
    
    @IBAction func didClickSave(_ sender: Any) {
        defaults.set(firstNameField.text, forKey: firstNameKey)
        defaults.set(lastNameField.text, forKey: lastNameKey)
        defaults.set(jobPositionField.text, forKey: jobKey)
        defaults.set(birthdayPicker.date, forKey: birthDayKey)
    }
    
    @IBAction func didClickClear(_ sender: Any) {
        let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                defaults.removeObject(forKey: key)
            }
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

