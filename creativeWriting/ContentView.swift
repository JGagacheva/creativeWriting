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
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath:
                                                        \Note.timeStamp,
                                                     ascending: false)],
                  animation: .default)
    private var notes: FetchedResults<Note>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes, id: \.self) {
                    note in
                    NavigationLink(destination: NoteViewingView(note: note)) {
                        NoteListView(note)
                    }
                    .listRowSeparator(.hidden)
                }.onDelete(perform: deleteNote)
            }
        
            .navigationTitle("Journal Logs")
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
    
    private func deleteNote(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                notes[$0]
            }
            .forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo).")
            }
        }
    }
}

/*
struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.timeStamp,
                                                     ascending: false)],
                  animation: .default)
    private var notes: FetchedResults<Note>
    // MARK: - private vars for UI
    @State private var showingSheet = false
    @State private var isExpanded = false
    private let color = Color.gray.opacity(0.5)
    @State private var contentSize: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                gradient
//                List {
//                    ForEach(notes, id: \.self) { note in
//                        FrontView(note)
//                        if isExpanded {
//                            ExpandedView(note)
//                        }
//                    }
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
                    .listRowBackground(
                        Capsule()
                            .fill(color)
                            .frame(width: geometry.size.width * 0.8)
                            .padding(.vertical, 1)
                            .padding(.horizontal, 0)
                    )
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .padding()
                .frame(width: geometry.size.width * 0.8)
                .transition(.move(edge: .bottom))
                
               
            }
        }
    }
}
 */


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}






