//
//  NoteListView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//
// MARK: This view shows what each note looks like in the list. 

import SwiftUI

struct NoteListView: View {
//    private var note: Note2
//    
//    init(_ note: Note2) {
//        self.note = note
//    }

    private var note: Note
    
    init(_ note: Note) {
        self.note = note
    }

    var body: some View {
        VStack (alignment: .leading, spacing:3) {
            Text(note.title ?? "")
                .font(.title2)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Text(note.timeStamp ?? .distantPast, formatter: dateFormatter)
                .font(.caption)
                .foregroundColor(.black.opacity(0.85))
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

/*
struct NoteListView_Previews: PreviewProvider {
  static var previews: some View {
//      let sample = Note2(title: "What are you thinking about?", body: "Tell me more")
      NoteListView(sample)
    }
}
*/
