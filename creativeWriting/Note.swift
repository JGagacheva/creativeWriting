//
//  Note.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//

import Foundation


struct Note: Hashable {
    var title: String
    var body: String
    var dateCreated: Date
    
    init(title: String = "", 
         body: String = "",
         dateCreated: Date = Date()) {
        self.title = title
        self.body = body
        self.dateCreated = dateCreated
    }
}
