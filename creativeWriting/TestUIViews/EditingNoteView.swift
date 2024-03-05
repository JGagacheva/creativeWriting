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
    @FocusState private var focusedField: FocusedField?
    
    enum FocusedField {
        case title, body
    }
    
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
            .focused($focusedField, equals: .title)
            
//            TextEditor(text: $note.body.toUnwrapped(defaultValue: "Tell me more..."))
            TextEditor(text: $note.body.toUnwrapped(defaultValue: ""))
                .font(.body)
                .foregroundStyle(.white)
                .scrollContentBackground(.hidden)
                .padding(.all)
                .autocorrectionDisabled(true)
                .focused($focusedField, equals: .body)
        }
        .onSubmit {
            if focusedField == .title {
                focusedField = .body
            } else {
                focusedField = nil
            }
        }
        .background(Color.black.opacity(0.75))
        .toolbar {
            Button {
                print("This is where an api call will be made.")
            } label: {
                Image(systemName: "sparkles")
                    .foregroundStyle(.white)
            }
        }
        
    }
}

