//
//  QuoteLoader.swift
//  InspiredQuotes
//
//  Created by The Miles Family on 3/15/18.
//  Copyright © 2018 Maeland. All rights reserved.
//

import Foundation

struct QuoteList {
    let quote: String
}
enum LoaderError: Error {
    case dictionaryFailed, pathFailed
}

class QuoteLoad {
    
    
    public func loadQuotes(forQuote quoteName: String) throws -> [QuoteList] {
        var quotes = [QuoteList]()
        if let path = Bundle.main.path(forResource: quoteName, ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                let tempArray: Array = dict["Quotes"]! as! [Dictionary<String,AnyObject>]
                for dictionary in tempArray {
                    let quoteToAdd = QuoteList(quote: dictionary["Quote"] as! String)
                    quotes.append(quoteToAdd)
                }
                return quotes
            } else {
                throw LoaderError.dictionaryFailed
            }
        } else {
            throw LoaderError.pathFailed
        }
 }
}
