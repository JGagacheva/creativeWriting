//
//  Note.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//

import Foundation

struct Note2: Hashable {
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

// MARK: For SwiftData but not used yet
/*
extension Note {
    static let note1 = Note(title: "Tell me about exploring the impact of emerging technologies, such as artificial intelligence and virtual reality, on education?",
                            body: "In the rapidly evolving landscape of education, the infusion of cutting-edge technologies is reshaping traditional learning paradigms. As artificial intelligence (AI) and virtual reality (VR) step into the spotlight, classrooms are becoming dynamic hubs of innovation. These technologies hold the promise of revolutionizing the way students engage with information, teachers instruct, and educational institutions function. In this exploration, we delve into the profound impact of AI and VR on education, unraveling the opportunities, challenges, and the seismic shifts occurring in the realm of learning...")
    static let note2 = Note(title: "The Enchanted Café: A Magical Haven Where Food Grants Wishes",
                            body: "Nestled in the heart of a charming town lies a café like no other — the Enchanted Café. Here, every dish holds a sprinkle of magic, and every sip is a sip of wishes come true. Imagine a place where the aroma of freshly brewed potions fills the air, and every culinary creation has the power to grant whimsical wishes. In this delightful exploration, we embark on a journey through the doors of the Enchanted Café, discovering the secrets behind its magical menu and the heartwarming tales of those whose wishes have been stirred into every dish...")
    static let note3 = Note(title: "This is another note with a biggggggggggerrrrrrr title.",
                           body: "Nestled in the heart of a charming town lies a café like no other — the Enchanted Café. Here, every dish holds a sprinkle of magic, and every sip is a sip of wishes come true. Imagine a place where the aroma of freshly brewed potions fills the air, and every culinary creation has the power to grant whimsical wishes. In this delightful exploration, we embark on a journey through the doors of the Enchanted Café, discovering the secrets behind its magical menu and the heartwarming tales of those whose wishes have been stirred into every dish...")
    static let note4 =  Note(title: "As an aspiring artist in a world where creativity was commodified and dreams were bought and sold like goods in a market, Amelia struggled to make ends meet.",
                             body: "Nestled in the heart of a charming town lies a café like no other — the Enchanted Café. Here, every dish holds a sprinkle of magic, and every sip is a sip of wishes come true. Imagine a place where the aroma of freshly brewed potions fills the air, and every culinary creation has the power to grant whimsical wishes. In this delightful exploration, we embark on a journey through the doors of the Enchanted Café, discovering the secrets behind its magical menu and the heartwarming tales of those whose wishes have been stirred into every dish...")
    
    
    static func insertSampleData(modelContext: ModelContext) {
        // Add the notes to the model context.
        modelContext.insert(note1)
        modelContext.insert(note2)
        modelContext.insert(note3)
        modelContext.insert(note4)
    }
}
*/
