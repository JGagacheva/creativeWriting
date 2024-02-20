//
//  ContentView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            FetchedObjects(sortDescriptors: customSortDescriptor()) {
                (notes: [Note]) in
                List {
                    ForEach(notes, id: \.self) {
                        note in
                        NavigationLink(destination: NoteViewingView(note: note)) {
                            NoteListView(note)
                        }
//                        .listRowBackground(gradient)
                        .listRowSeparator(.hidden)
                    }
                }
                .navigationTitle("Journal Logs")
//                .background(gradient)
                .scrollContentBackground(.hidden)
                .listStyle(.inset)
                .toolbar {
                    Button {
                        showingSheet = true
                        print("this button will prodice a new note.")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingSheet, content: {
                    NavigationStack { NoteView() }
                })
            }
        }
    }
    func customSortDescriptor() -> [NSSortDescriptor] {
        return [NSSortDescriptor(keyPath: \Note.timeStamp, ascending: false)]

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


var gradient: some View {
    LinearGradient(
        gradient: Gradient(colors: [
            Color(red: (130.0 / 255.0), green: (109.0 / 255.0), blue: (210.0 / 255.0)),
            Color(red: (130.0 / 255.0), green: (130.0 / 255.0), blue: (221.0 / 255.0)),
            Color(red: (131.0 / 255.0), green: (160.0 / 255.0), blue: (238.0 / 255.0))
        ]),
        startPoint: .leading,
        endPoint: .trailing
    )
    .flipsForRightToLeftLayoutDirection(false)
    .ignoresSafeArea()
}



