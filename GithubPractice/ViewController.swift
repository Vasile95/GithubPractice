//
//  ViewController.swift
//  GithubPractice
//
//  Created by Vasile Vornic on 3/14/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var jobPositionField: UITextField!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var saveButton: HighlightButton!
    @IBOutlet weak var clearButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        jobPositionField.delegate = self
        
        saveButton.layer.cornerRadius = 8
        
        if let job = defaults.string(forKey: "Job") {
            jobPositionField.text = job
        }
        
        if let date = defaults.object(forKey: "BirthDay"){
            birthdayPicker.date = date as! Date
        }
       
    }
    
    @IBAction func didClickSave(_ sender: Any) {
        defaults.set(jobPositionField.text, forKey: "Job")
        defaults.set(birthdayPicker.date, forKey: "BirthDay")
    }
    
    @IBAction func didClickClear(_ sender: Any) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}



