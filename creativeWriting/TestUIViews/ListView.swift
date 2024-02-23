//
//  ListView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
//

import SwiftUI

struct ListView: View {
    // MARK: - Managed Data
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Note.timeStamp,
                                                     ascending: false)],
                  animation: .default)
    private var notes: FetchedResults<Note>
    
    //MARK: - UI vars
    
    private let color = Color.gray.opacity(0.5)
    
    var body: some View {
        GeometryReader { geometry in
//            ZStack {
//                gradient
                ScrollView(showsIndicators: false) {
                    BannerView()
                    ForEach(notes, id: \.self) { note in
                        VStack {
                            ListSubView(
                                note.title ?? "", note.body ?? "",
                                onDelete: {
                                    print("We should remove \(note)")
                                    viewContext.delete(note)
                                    do {
                                        try viewContext.save()
                                    } catch {
                                        let nsError = error as NSError
                                        fatalError("Unresolved error \(nsError), \(nsError.userInfo).")
                                    }
                                }
                            )
                            // Scroll custom trasition
                            .scrollTransition(.animated.threshold(.visible(0.9))) { content, phase in content
                                    .opacity(phase.isIdentity ? 1 : 0.85)
                                    .scaleEffect(phase.isIdentity ? 1 : 0.75)
                                    .blur(radius: phase.isIdentity ? 0 : 3)
                            }
                        }
                        .frame(width: geometry.size.width * 0.9)
                    }
                }
                .padding([.leading, .trailing], 20)
//            }
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
