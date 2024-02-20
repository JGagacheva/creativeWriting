//
//  Note+Extension.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/19/24.
//

import CoreData
import Foundation

extension Note {
    
    private static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }
    
    class func deleteAll(_ context: NSManagedObjectContext) {
        let request = Note.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            guard let persistentStoreCoordinator = context.persistentStoreCoordinator else { return }
            try persistentStoreCoordinator.execute(deleteRequest, with: context)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    class func saveDatabase(_ context: NSManagedObjectContext) {
        guard context.hasChanges else { return}
        do {
            try context.save()
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    class func createNotes(_ viewContext: NSManagedObjectContext) {
        
        let introNote = Note(context: viewContext)
        introNote.title = "What are you thinking about?"
        introNote.body = "Tell me more."
        
        
        let secondNote = Note(context: viewContext)
        secondNote.title = "Tell me about exploring the impact of emerging technologies, such as artificial intelligence and virtual reality, on education?"
        secondNote.body = "In the rapidly evolving landscape of education, the infusion of cutting-edge technologies is reshaping traditional learning paradigms. As artificial intelligence (AI) and virtual reality (VR) step into the spotlight, classrooms are becoming dynamic hubs of innovation. These technologies hold the promise of revolutionizing the way students engage with information, teachers instruct, and educational institutions function. In this exploration, we delve into the profound impact of AI and VR on education, unraveling the opportunities, challenges, and the seismic shifts occurring in the realm of learning..."

        /*
        let cremeBurlee = Note(context: viewContext)
        cremeBurlee.name = "Crème Burlée"
        cremeBurlee.size = "Medium"
        cremeBurlee.price = 3.99
        cremeBurlee.fromCustomer = [customer1]

        
        let cremeBurlee2 = Note(context: viewContext)
        cremeBurlee2.name = "Crème Burlée"
        cremeBurlee2.size = "Extra Large"
        cremeBurlee2.price = 5.99
        cremeBurlee2.fromCustomer = [customer2]

        
        let iceCream = Note(context: viewContext)
        iceCream.name = "Ice Cream"
        iceCream.size = "Small"
        iceCream.price = 2.99
        iceCream.fromCustomer = [customer1]

        
        let iceCream2 = Note(context: viewContext)
        iceCream2.name = "Ice Cream"
        iceCream2.size = "Extra Large"
        iceCream2.price = 6.99
        iceCream2.fromCustomer = [customer2]

        
        let applePie = Note(context: viewContext)
        applePie.name = "Apple Pie"
        applePie.size = "Small"
        applePie.price = 2.99
        applePie.fromCustomer = [customer1]

        
        let applePie2 = Note(context: viewContext)
        applePie2.name = "Apple Pie"
        applePie2.size = "Full"
        applePie2.price = 12.99
        applePie2.fromCustomer = [customer2]

        
        let imperatrice = Note(context: viewContext)
        imperatrice.name = "Riz à l'impératrice"
        imperatrice.size = "Small"
        imperatrice.price = 2.99
        imperatrice.fromCustomer = [customer1]

        
        let cheeseCake = Note(context: viewContext)
        cheeseCake.name = "Cheese Cake"
        cheeseCake.size = "Extra Small"
        cheeseCake.price = 4.99
        cheeseCake.fromCustomer = [customer2]

        
        let carrotCake = Note(context: viewContext)
        carrotCake.name = "Carrot Cake"
        carrotCake.size = "Standard"
        carrotCake.price = 3.99
        carrotCake.fromCustomer = [customer1]

        
        let piece = Note(context: viewContext)
        piece.name = "Pièce montée"
        piece.size = "Medium"
        piece.price = 5.99
        piece.fromCustomer = [customer2]

        
        let eclair = Note(context: viewContext)
        eclair.name = "Éclair"
        eclair.size = "Large"
        eclair.price = 3.99
        eclair.fromCustomer = [customer1]

        
        let crepe = Note(context: viewContext)
        crepe.name = "Crêpe Suzette"
        crepe.size = "Extra Large"
        crepe.price = 3.99
        crepe.fromCustomer = [customer2]

        
        
        let orangeCake = Note(context: viewContext)
        orangeCake.name = "Orange Cake"
        orangeCake.size = "Large"
        orangeCake.price = 3.99
        orangeCake.fromCustomer = [customer1]

        
        
        let vanillaCake = Note(context: viewContext)
        vanillaCake.name = "Vanilla Cake"
        vanillaCake.size = "Extra Large"
        vanillaCake.price = 4.99
        vanillaCake.fromCustomer = [customer2]

        
        
        let weddingCake = Note(context: viewContext)
        weddingCake.name = "Wedding Cake"
        weddingCake.size = "Regular"
        weddingCake.price = 15.99
        weddingCake.fromCustomer = [customer1]

        
        
        let lemonCake = Note(context: viewContext)
        lemonCake.name = "Lemon Cake"
        lemonCake.size = "Regular"
        lemonCake.price = 15.99
        lemonCake.fromCustomer = [customer2]

        
        let bananaCake = Note(context: viewContext)
        bananaCake.name = "Banana Cake"
        bananaCake.size = "Regular"
        bananaCake.price = 15.99
        bananaCake.fromCustomer = [customer1]


        Note.saveDatabase(viewContext)
         */
    }
}
