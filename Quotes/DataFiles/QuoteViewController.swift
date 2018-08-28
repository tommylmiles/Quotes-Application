//
//  ViewController.swift
//  Quotes
//
//  Created by The Miles Family on 7/28/18.
//  Copyright © 2018 Maeland. All rights reserved.
//

import UIKit
import UserNotifications

var clockInfo = Date()

class QuoteViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!

    var theHour = 0
    var theMinute = 0
    
    
    //Create Array of Quotes and set Quotes to a PLIST File
    private let quoteLoader = QuoteLoad()
    private var quoteArray = [QuoteList]()
    
    //Keep track of the Quote Displaying
    private var quoteIndex = 0
    private var currentQuote: QuoteList!
    
    //Set Background
    let colorBackground = quotesBackgroundColor()
    let imageBackground = quotesBackgroundImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentDate()
        loadQuotes()
        
        let content = UNMutableNotificationContent()
        content.title = "Quote of the Day"
        content.body = currentQuote.quote
        content.sound = UNNotificationSound.default()
        
        //let selectedDate = Calendar.current.dateComponents([.hour,.minute], from: datePicker.date)
        
        var dateComp = DateComponents()
        dateComp.hour = theHour
        dateComp.minute = theMinute
        
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: dateComp, repeats: true)
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]){(granted,error) in }
        let current = UNUserNotificationCenter.current()
        current.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadQuotes(){
        do{
            let newColor = colorBackground.randomColor()
            let newBackground = imageBackground.randomImage()
            view.backgroundColor = newColor
            ImageView.image = newBackground
            quoteArray = try quoteLoader.loadQuotes(forQuote: "quoteData")
            quoteIndex = Int(arc4random_uniform(50))
            currentQuote = quoteArray[quoteIndex]
            quoteLabel.text = currentQuote.quote
            
        }catch{
            switch error {
            case LoaderError.dictionaryFailed:
                print("Could not load dictionary")
            case LoaderError.pathFailed:
                print("Could not find valid file at path")
            default:
                print("Unknow Error")
            }
        }
    }
    
    func displayCurrentDate(){
        let dayDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM dd, YYYY"
        let result = formatter.string(from: dayDate)
        dayLabel.text = result
    }
    
    /*func configDate(){
        
        
        
        let content = UNMutableNotificationContent()
        content.title = "Quote of the Day"
        content.body = currentQuote.quote
        content.sound = UNNotificationSound.default()
        
        //let selectedDate = Calendar.current.dateComponents([.hour,.minute], from: datePicker.date)
        
        var dateComp = DateComponents()
        dateComp.hour = 0
        dateComp.minute = 0
        
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: dateComp, repeats: true)
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        
        
    } */
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification.request.identifier == "TestIdentifier" {
            print("handling notifications with the TestIdentifier Identifier")
        }
        
        completionHandler()
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        let vc = UIActivityViewController(activityItems: [quoteLabel.text!], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
        
    }
    
}

