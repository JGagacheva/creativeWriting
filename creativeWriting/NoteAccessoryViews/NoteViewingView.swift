//
//  NoteViewingView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/7/24.
// MARK: The view that is navigated to from the list to look at the specific note.

import SwiftUI

struct NoteViewingView: View {
    private var note: Note
    
    init(_ note: Note) {
        self.note = note
    }
    
    var body: some View {
        VStack {
            Text(note.title)
                .font(.title)
                .fontWeight(.bold)
                .padding([.bottom, .leading, .trailing], 10)
            Text(note.body)
                .font(.body)
                .lineSpacing(10)
                .padding(.all)
            Spacer()
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
*/
struct NoteViewingView_Previews: PreviewProvider {
  static var previews: some View {
      let sample = Note(title: "In a world where emotions manifest physically, a young girl discovers she has the ability to manipulate these emotions.", body: "A young girl discovers she has the ability to manipulate these emotions. However, her power comes with a price: every time she uses it, she loses a part of her own emotional capacity. Write a story exploring her journey as she grapples with the consequences of her power and struggles to find balance between helping others and preserving her own humanity.", dateCreated: Date.now)
      NoteViewingView(sample)
  }
}
