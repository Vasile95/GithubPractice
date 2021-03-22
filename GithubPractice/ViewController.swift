//
//  ViewController.swift
//  GithubPractice
//
//  Created by Vasile Vornic on 3/14/21.
//

import UIKit

enum UserResult {
    case succes
    case failure
}

class ViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var jobPositionField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var saveButton: HighlightButton!
    @IBOutlet weak var clearButton: HighlightButton!
    
    var saveResult: UserResult = .failure
    
    private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        jobPositionField.delegate = self
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        
        if let fisrtName = defaults.string(forKey: Constants.firstNameKey) {
            firstNameField.text = fisrtName
        }
        
        if let lastName = defaults.string(forKey: Constants.lastNameKey) {
            lastNameField.text = lastName
        }
        
        if let job = defaults.string(forKey: Constants.jobKey) {
            jobPositionField.text = job
        }
        
        if let date = defaults.object(forKey: Constants.birthDayKey) as? Date{
            birthdayPicker.date = date
        }
    }
    
    @IBAction func didClickSave(_ sender: Any) {
        saveData()
    }
    
    @IBAction func didClickClear(_ sender: Any) {
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    func saveData() {
        saveName()
        defaults.set(lastNameField.text, forKey: Constants.lastNameKey)
        defaults.set(jobPositionField.text, forKey: Constants.jobKey)
        defaults.set(birthdayPicker.date, forKey: Constants.birthDayKey)
    }
    
    func saveName() {
        validation()
        switch saveResult {
        case .succes:
            saveButton.backgroundColor = .green
            defaults.set(firstNameField.text, forKey: Constants.firstNameKey)
        case .failure:
            saveButton.backgroundColor = .red
        }
    }
    
    func validation(){
        let str = firstNameField.text!
        let components = str.components(separatedBy: .whitespacesAndNewlines)
        saveResult = components.count == 1 ? .succes : .failure
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

