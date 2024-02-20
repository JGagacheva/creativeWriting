//
//  NoteViewingView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/7/24.
// MARK: The view that is navigated to from the list to look at the specific note.

import SwiftUI

struct NoteViewingView: View {
//    private var note: Note2
    
//    init(_ note: Note2) {
//        self.note = note
//    }
    
    private var note: Note
    
    init(note: Note) {
        self.note = note
    }
    
    var body: some View {
        ScrollView { 
            VStack {
                Text(note.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.bottom, .leading, .trailing], 20)
                Text(note.body ?? "")
                    .font(.body)
                    .lineSpacing(10)
                    .padding(.all, 20)
                Spacer()
            }
        }
        .padding(.top, -40)
        .toolbar {
            Button {
                print("This button will open editing view for the note.")
            } label: {
                Text("Edit")
            }
        }
    }
}

/*
#Preview {
    NoteViewingView()
}

struct NoteViewingView_Previews: PreviewProvider {
  static var previews: some View {
      let sample = Note
      NoteViewingView(note: note)
  }
}
*/
