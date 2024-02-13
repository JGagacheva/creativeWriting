//
//  NoteView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
// 

import SwiftUI

struct NoteView: View {
    @State private var inputTitle: String = ""
    @State private var inputBody: String = "Tell me more..."
    @State private var bodyPlaceholder: Bool = true
    @EnvironmentObject var samples: SampleNote
    
    
    var body: some View {
        VStack {
            TextField("title",
                      text: $inputTitle,
                      prompt: Text("Ready to be creative?"))
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
                .autocorrectionDisabled(true)
            
            Spacer()
            Button(action: {
                // TODO: Call save function
                saveNote()
                print("The Save button has been pressed.")
            }, label: {
                Text("Save")
                    .font(.title3)
            })
        }
        .toolbar {
            Button {
                print("This is where an api call will be made.")
            } label: {
                Image(systemName: "dice")
            }
        }
    }
    // MARK: Will come back to this to store the note.
    private func saveNote() {
        samples.contents.append(Note(title: inputTitle,
                                     body: inputBody,
                                     dateCreated: Date.now
                                     ))
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView().environmentObject(SampleNote())
    }
}
