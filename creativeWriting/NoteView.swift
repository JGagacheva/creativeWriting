//
//  NoteView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
// MARK: The view that is navigated to from the list to look at the specific note.

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var samples: SampleNote
    private var note: Note
    @State var inputTitle: String = ""
    @State var inputBody: String = "Tell me more!"
    @State private var bodyPlaceholder: Bool = true
    
    // attributes to aid in saving a note locally
    @State private var temporaryNote = Note()
    // this flag will trigger .onChange
    @State var mustChangeNote = true
    
    init(_ note: Note) {
        self.note = note
    }
    
    var body: some View {
        VStack {
            TextField("Ready to be creative?", text: $inputTitle)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            TextEditor(text: $inputBody)
                .font(.body)
                .opacity(bodyPlaceholder ? 0.25 : 1)
                .scrollContentBackground(.hidden)
                .padding(.all)
                .onTapGesture {
                    if bodyPlaceholder {
                        inputBody = ""
                        bodyPlaceholder = false
                    }
                }
            
            Spacer()
            Button(action: {
                saveNote()
                print("The Save button has been pressed.")
            }, label: {
                Text("Save")
                    .font(.title3)
            })
        }
        // This is a hack, to bring the content up
        // try to comment this line and see what happens.
        .padding(.top, -40)
        // MARK: Will come back to this to store the note.
        .onChange(of: mustChangeNote) { _, _ in
            samples.note = temporaryNote
        }
    }
    
    private func saveNote() {
        // create new temporary note
        let temporaryNote = Note(title: inputTitle,
                                 body: inputBody,
                                 dateCreated: Date.now
                                 )
        // store the temporary note locally
        self.temporaryNote = temporaryNote
        // set the flag to defer changing to the model (see .onChange)
        self.mustChangeNote.toggle()
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let sample = Note(title: "Hello!", body: "This is a sample body.")
        NoteView(sample).environmentObject(SampleNote())
    }
}
