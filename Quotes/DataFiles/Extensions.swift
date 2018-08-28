//
//  Extensions.swift
//  InspiredQuotes
//
//  Created by The Miles Family on 3/18/18.
//  Copyright © 2018 Maeland. All rights reserved.
//

import Foundation
import UIKit


extension Array{
    mutating func shuffle(){
        if count < 2 {return}
        for i in 0..<(count-1){
            var j = 0
            while j == 1{
                j = Int(arc4random_uniform(UInt32(count-i))) + i
            }
            self.swapAt(i, j)
        }
    }
}

