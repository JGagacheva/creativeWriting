//
//  TestContentView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/22/24.
//

import SwiftUI

struct TestContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var navigateToNewNote = false
    
    //MARK: Test
    @Binding var saveNote: Bool
    
    var body: some View {
        ZStack {
            gradient
            ListView()
        }.safeAreaInset(edge: VerticalEdge.bottom, spacing: 10) {
            Button {
                print("New note button pressed!")
                navigateToNewNote = true
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(.white)
            }
            .padding()
            .background(Color.black.opacity(0.6))
            .clipShape(Circle())
            .sheet(isPresented: $navigateToNewNote, 
                   onDismiss: didDismiss,
                   content: {
                NavigationStack {
                    let newNote = Note(context: viewContext)
//                    newNote = Note(context: viewContext)
                    EditingNoteView(newNote)
//                    NoteView()
                }
            })
        }
        .preferredColorScheme(.dark)
    }
    func didDismiss() {
        if saveNote == true {
            withAnimation {
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
    }
}


struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

