//
//  ContentView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/6/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var samples = SampleNote()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(samples.contents, id: \.self) {
                    note in NavigationLink(destination:  NoteView(note)/*EmptyView()*/) {
                        NoteListView(note)
                    }
                    .padding([.bottom, .top], 5)
                }
            }
            .navigationBarTitle("Journal Logs")
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
