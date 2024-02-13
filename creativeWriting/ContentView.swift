//
//  ContentView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var samples = SampleNote()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(samples.contents, id: \.self) {
                    note in NavigationLink(destination: NoteViewingView(note)) {
                        NoteListView(note)
                    }
                    .padding([.bottom, .top], 5)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



