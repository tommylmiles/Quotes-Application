//
//  AboutScreen.swift
//  Quotes
//
//  Created by tommylmiles on 8/28/18.
//  Copyright © 2018 Maeland. All rights reserved.
//
import UIKit
import paper_onboarding

class AboutScreen: UIViewController {
    
    var userData = UserDefaults.standard
    
    @IBOutlet weak var onboardingObj: OnboardingViewClass!
    
    @IBOutlet weak var getStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingObj.dataSource = self
        onboardingObj.delegate = self
    }
    
    @IBAction func startPressed(_ sender: Any) {
        
        userData.set(true, forKey: "aboutComplete")
        userData.synchronize()
    }
    
}

extension AboutScreen: PaperOnboardingDataSource, PaperOnboardingDelegate {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        /*
         let bgOne = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
         let textColor = UIColor.white
         let rocket  = UIImage(named: "rocket") as UIImage!
         let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
         let descptFont = UIFont(name: "AvenirNext-Regular", size: 18)!
         
         return[("rocket","A Quote","Quotes can offer up a bit of encouragement or a starting Point","rocket",bgOne,textColor,textColor,titleFont,descptFont)][0]*/
        
        
        
        return [
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "quote1"),
                               title: "Why Quotes?",
                               description: "Many of the issues and roadblocks we come across in life have been lived through by many others. There are many nuggets of guidence found in quotes. If you are stuck in life, reading a quote about the nature of your issue can ofter times help.",
                               pageIcon: #imageLiteral(resourceName: "button"),
                               color: UIColor.blue,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: UIFont(name: "AvenirNext-Bold", size: 30)!,
                               descriptionFont: UIFont(name: "AvenirNext-Regular", size: 18)!),
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "quote2"),
                               title: "Why Quotes?",
                               description: "Inspirational words ofter remind us about what we already know, or inspire to be. They trigger something within us to get back on track.",
                               pageIcon: #imageLiteral(resourceName: "button"),
                               color: UIColor.black,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: UIFont(name: "AvenirNext-Bold", size: 30)!,
                               descriptionFont: UIFont(name: "AvenirNext-Regular", size: 18)!),
            OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "quote3"),
                               title: "Why Quotes?",
                               description: "Quotes can offer up a bit of encouragement or a starting point.",
                               pageIcon: #imageLiteral(resourceName: "button"),
                               color: UIColor.purple,
                               titleColor: UIColor.white,
                               descriptionColor: UIColor.white,
                               titleFont: UIFont(name: "AvenirNext-Bold", size: 30)!,
                               descriptionFont: UIFont(name: "AvenirNext-Regular", size: 18)!)
            
            ][index]
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            getStart.isHidden = false
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        
        if index != 2{
            if getStart.isHidden == false{
                getStart.isHidden = true
            }
        }
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index _: Int) {
        
    }
    
}














