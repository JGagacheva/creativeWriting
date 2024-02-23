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
    
    init(_ note: Note) {
        self.note = note
    }
    
    var body: some View {
        VStack {
            TextField("\(note.title ?? "")",
                      text: $note.title.toUnwrapped(defaultValue: ""))
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            
            TextEditor(text: $note.body.toUnwrapped(defaultValue: ""))
                .font(.body)
                .foregroundStyle(.white)
                .scrollContentBackground(.hidden)
                .padding(.all)
                .autocorrectionDisabled(true)
            
        }
    }
}

