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
                    ForEach(notes, id: \.self) { note in
                        VStack {
                            ListSubView(note.title ?? "", note.body ?? "")
                        }
                        .frame(width: geometry.size.width * 0.9)
                    }
                }
                .padding([.leading, .trailing], 20)
//            }
        }
    }
}
