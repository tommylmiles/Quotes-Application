//
//  quotesBackgroundColor.swift
//  InspiredQuotes
//
//  Created by The Miles Family on 3/21/18.
//  Copyright © 2018 Maeland. All rights reserved.
//

import UIKit
import GameKit
struct quotesBackgroundImage {
    
    var logoImages: [UIImage] = [
        UIImage(named: "back1")!,
        UIImage(named: "back2")!,
        UIImage(named: "back3")!,
        UIImage(named: "back4")!,
        UIImage(named: "back5")!,
        UIImage(named: "back6")!,
        
    
    ]
    
    
    func randomImage() -> UIImage {
        
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound:logoImages.count)
        return logoImages[randomNumber]
        
    }
    
}
