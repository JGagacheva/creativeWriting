//
//  TestContentView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/22/24.
//

import SwiftUI
import CoreData

struct TestContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var editingNoteID: NSManagedObjectID? = nil
    
    //MARK: Test
    // @Binding var saveNote: Bool
    
    var body: some View {
        let isSheetVisible: Binding<Bool> = .init {
            editingNoteID != nil
        } set: { isSheetVisible in
            if isSheetVisible {
                // … hopefully editingNoteID has something and isn't nil otherwise we're fucked …
                assertionFailure()
            } else {
                // Remove empty note
                if let editingNoteID = self.editingNoteID,
                   let editingNote = try? viewContext.existingObject(with: editingNoteID) as? Note {
                    let emptyTitle = editingNote.title == "" || editingNote.title == nil
                    let emptyBody = editingNote.body == "" || editingNote.body == nil
                    if emptyTitle, emptyBody {
                        print("Note is empty! Deleting…")
                        viewContext.delete(editingNote)
                    }
                }
                
                // Save
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                
                // Clear edit note id
                editingNoteID = nil
            }
        }
        
        ZStack {
            gradient
            ListView()
        }.safeAreaInset(edge: VerticalEdge.bottom, spacing: 10) {
            Button {
                print("New note button pressed!")
                let newNote = Note(context: viewContext)
                newNote.timeStamp = Date()
                editingNoteID = newNote.objectID
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
            }
            .padding()
            .background(Color.black.opacity(0.6))
            .clipShape(Circle())
            .sheet(isPresented: isSheetVisible,
                   content: {
                NavigationStack {
//                    newNote = Note(context: viewContext)
                    if let editingNoteID = self.editingNoteID,
                       let editingNote = try? viewContext.existingObject(with: editingNoteID) as? Note {
                        EditingNoteView(editingNote)
                    } else {
                        Text("Unable to edit note. Sorry.")
                    }
                }
            })
        }
        .preferredColorScheme(.dark)
    }
    
}


struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

