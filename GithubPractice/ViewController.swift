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
        
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        
        if let fisrtName = defaults.string(forKey: Constants.firstNameKey) {
            firstNameField.text = fisrtName
        }
        
        if let lastName = defaults.string(forKey: Constants.lastNameKey){
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
        saveName(firstNameField.text, Constants.firstNameKey)
        
        defaults.set(lastNameField.text, forKey: Constants.lastNameKey)
        defaults.set(jobPositionField.text, forKey: Constants.jobKey)
        defaults.set(birthdayPicker.date, forKey: Constants.birthDayKey)
    }
    
    @IBAction func didClickClear(_ sender: Any) {
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    func saveName(_ name: String?, _ key: String){
        if let firstName = name {
            changeBtnBackground(valid: validation(str: firstName))
            if validation(str: firstName) {
                defaults.set(firstName, forKey: key)
            }
        }
    }
    
    func changeBtnBackground( valid: Bool){
        if valid {
            saveButton.backgroundColor = UIColor(named: "Light Green")
        } else {
            saveButton.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
    
    func validation(str: String) -> Bool{
        let components = str.components(separatedBy: .whitespacesAndNewlines)
        if components.count == 1 {
            return true
        } else {
            return false
        }
    }
    
    
//    // IMPLEMENTATION
//    enum LookupError: ErrorType {
//      case InvalidName
//      case NullData
//    }
//
//    enum UserResult {
//      case Success(String)
//      case Error(LookupError)
//    }
//
//    func findUserStatus(name: String) -> UserResult {
//      guard let userStats = users[name] else {
//        return .Error(InvalidName)
//      }
//      return .Success(userStats)
//    }
//
//    // USAGE
//    switch findUserStatus("Stevie Wonder") {
//      case let .Success(stats):
//        print("Stevie Wonder's Stats: \(stats)")
//      case let .Error(error):
//        print("Error: \(error));
//    }
    
    
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

