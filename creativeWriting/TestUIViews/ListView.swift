//
//  ListView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
//

import SwiftUI
import CoreData

struct ListView: View {
    // MARK: - Managed Data
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.timeStamp,
                                                     ascending: false)],
                  animation: .default)
    private var notes: FetchedResults<Note>
    
    //MARK: - UI vars
    
    private let color = Color.gray.opacity(0.5)
    @State var editingNoteID: NSManagedObjectID? = nil

    
    var body: some View {
        let isSheetVisible: Binding<Bool> = .init {
            editingNoteID != nil
        } set: { isSheetVisible in
            if isSheetVisible {
                // … hopefully editingNoteID has something and isn't nil otherwise we're fucked …
                assertionFailure()
            } else {
                editingNoteID = nil
            }
        }

        GeometryReader { geometry in
            ScrollViewReader { reader in
                ScrollView(showsIndicators: false) {
                    BannerView()
                    ForEach(Array(notes.enumerated()), id: \.offset) { index, note in
                        VStack {
                            ListSubView(
                                note.title ?? "", note.body ?? "", 
                                sampleDate: note.timeStamp ?? .distantPast,
                                onDelete: {
                                    print("We should remove \(note)")
                                    viewContext.delete(note)
                                    do {
                                        try viewContext.save()
                                    } catch {
                                        let nsError = error as NSError
                                        fatalError("Unresolved error \(nsError), \(nsError.userInfo).")
                                    }
                                }, onEdit: {
                                    // This updates the state of the view and sets editingNoteID to note.objectID which causes the view to update.
                                    editingNoteID = note.objectID
                                },
                                id: index,
                                proxy: reader
                            )
                            // Scroll custom trasition
//                            .scrollTransition(.animated.threshold(.visible(0.9))) { content, phase in content
//                                    .opacity(phase.isIdentity ? 1 : 0.85)
//                                    .scaleEffect(phase.isIdentity ? 1 : 0.75)
//                                    .blur(radius: phase.isIdentity ? 0 : 1)
//                            }
                        }
                        .frame(width: geometry.size.width * 0.9)
                    }
                }
                .padding([.leading, .trailing], 20)
                .sheet(isPresented: isSheetVisible, content: {
                    NavigationStack {
                        if let editingNoteID = self.editingNoteID,
                           let editingNote = try? viewContext.existingObject(with: editingNoteID) as? Note {
                            EditingNoteView(editingNote)
                        } else {
                            Text("Unable to edit note. Sorry.")
                        }
                    }
                })
            }
        }
    }
}
struct BannerView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        AsyncImage(url: URL(string: "https://schoolofplot.com/cdn/shop/articles/how_to_write_cozy_fantasy.jpg?v=1700482778")) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit) // or .fill
                .clipShape(.buttonBorder)
                .onTapGesture {
                    withAnimation {
                        showingSheet = true
                    }
                }
          } placeholder: {
            ProgressView()
          }
          .sheet(isPresented: $showingSheet, content: {
              NavigationStack { NoteView() }
          })
    }
}


/*
 onEdit:
 This updates the state of the view
 and sets editingNoteID to note.objectID
 which causes the view to update
 and then, when the fire nation attacked…
 the isSheetVisible is re-evaluated
 by .sheet(isPresented: isSheetVisible)
 which returns true, so the sheet shows up.
 
 100 years passed, and the sheet called the
 set function on the binding.
 but I believe, the binding is ready… to save the world.
 */
