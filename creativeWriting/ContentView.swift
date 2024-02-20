//
//  ContentView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//

import SwiftUI

/*
struct ContentView: View {
    @StateObject var samples = SampleNote()
    @State private var showingSheet = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
        
    var body: some View {
        NavigationView {
            List {
                ForEach(samples.contents, id: \.self) {
                    note in NavigationLink(destination: NoteViewingView(note)) {
                            NoteListView(note)
                    }
                    .padding([.bottom, .top], 5)
                }
                .listRowSeparator(.hidden)
            }
            .navigationBarTitle("Journal Logs")
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
*/


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
                        .listRowSeparator(.hidden)
                    }
                }
                .navigationBarTitle("Journal Logs")
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
        return [NSSortDescriptor(keyPath: \Note.title, ascending: true)]
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



