//
//  NoteListView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//
// MARK: This view shows what each note looks like in the list. 

import SwiftUI

struct NoteListView: View {
    private var note: Note
    
    init(_ note: Note) {
        self.note = note
    }
        
    var body: some View {
        VStack (alignment: .leading, spacing:3) {
            Text(note.title)
                .font(.title2)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Text(note.dateCreated, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        }
        
    }
}

struct NoteListView_Previews: PreviewProvider {
  static var previews: some View {
      let sample = Note(title: "What are you thinking about?", body: "Tell me more")
      NoteListView(sample)
    }
}
