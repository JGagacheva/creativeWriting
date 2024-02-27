//
//  EditingNoteView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
//

import SwiftUI


extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

struct EditingNoteView: View {
    @ObservedObject var note: Note
    @Environment(\.managedObjectContext) private var viewContext
    
    init(_ note: Note) {
        self.note = note
    }
    
    var body: some View {
        VStack {
            TextField("\(note.title ?? "")",
                      text: $note.title.toUnwrapped(defaultValue: ""),
                      prompt: Text("Ready to be creative?")
                      .foregroundStyle(Color.white.opacity(0.45)),
                      axis: .vertical)
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .padding([.bottom, .leading, .trailing])
            
            TextEditor(text: $note.body.toUnwrapped(defaultValue: "Tell me more..."))
                .font(.body)
                .foregroundStyle(.white)
                .scrollContentBackground(.hidden)
                .padding(.all)
                .autocorrectionDisabled(true)
            Spacer()
            Button(action: {
                saveEdits()
                print("The Save button has been pressed.")
            }, label: {
                Text("Save")
                    .font(.title3)
                    .foregroundStyle(.white)
            })
        }
    }
    private func saveEdits() {
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

