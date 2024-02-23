//
//  TestContentView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/22/24.
//

import SwiftUI

struct TestContentView: View {
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
            ZStack {
                gradient
                ScrollView(showsIndicators: false) {
                    ForEach(notes, id: \.self) { note in
                        VStack {
                            SubView(note.title ?? "", note.body ?? "")
                        }
                        .frame(width: geometry.size.width * 0.9)
                    }
                }
            }
        }
        
    }
}

struct SubView: View {
    @State var isExpanded = false
    private let color = Color.gray.opacity(0.5)
    let sampleTitle: String
    let sampleBody: String
    
    init(_ sampleTitle: String, _ sampleBody: String) {
        self.sampleTitle = sampleTitle
        self.sampleBody = sampleBody
    }
    
    var body: some View {
//        GeometryReader { geometry in
            VStack {
                FrontView(sampleTitle)
                if isExpanded {
                    ExpandedView(sampleBody)
                }
            }
            .padding()
            .transition(.move(edge: .bottom))
            .background(color.cornerRadius(10.0))
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
//        }
    }
}


struct TestContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
