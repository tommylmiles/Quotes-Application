//
//  SettingsViewController.swift
//  Quotes
//
//  Created by tommylmiles on 8/27/18.
//  Copyright © 2018 Maeland. All rights reserved.
//

import Foundation
import UIKit

//var clockInfo = Date()


class SettingsViewController: UIViewController {
    
    var hourSelected = 0
    var minuteSelected = 0

    
    @IBOutlet weak var datePickertxt: UITextField!
    
    let datePicker = UIDatePicker()
    
    func createDatePicker(){
        datePicker.datePickerMode = .time
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        datePickertxt.inputAccessoryView = toolbar
        datePickertxt.inputView = datePicker
        
    }
    
    override func viewDidLoad() {
        createDatePicker()
        
    }
    @objc func donePressed(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        datePickertxt.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
        clockInfo = datePicker.date
        configDate()
        
    }
    func configDate(){
        
        let selectedDate = Calendar.current.dateComponents([.hour,.minute], from: datePicker.date)
        
        hourSelected = selectedDate.hour!
        minuteSelected = selectedDate.minute!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let QuoteViewController = segue.destination as? QuoteViewController{
            QuoteViewController.theHour = self.hourSelected
            QuoteViewController.theMinute = self.minuteSelected
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        
    }
    
    
}
