//
//  ListSubView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
// MARK: The view of every individual note as it is expanded and reduced in the group of notes.

import SwiftUI

struct ListSubView: View, Delegate {
    @State var isExpanded = false
    var id: Int
    var proxy: ScrollViewProxy
    
    private let color = Color.gray.opacity(0.5)
    let sampleTitle: String
    let sampleDate: Date
    let sampleBody: String
    let onDelete: (() -> ())?
    let onEdit: (() -> ())?
    
    init(_ sampleTitle: String, _ sampleBody: String, sampleDate: Date, onDelete: (() -> ())?, onEdit: (() -> ())?, id: Int, proxy: ScrollViewProxy) {
        self.sampleTitle = sampleTitle
        self.sampleBody = sampleBody
        self.sampleDate = sampleDate
        self.onDelete = onDelete
        self.onEdit = onEdit
        self.id = id
        self.proxy = proxy
    }
    
    func deletemeh() {
        onDelete?()
    }
    
    func editMe() {
        onEdit?()
    }
    
    var body: some View {
        VStack {
            FrontView(sampleTitle, sampleDate: sampleDate)
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                }
            if isExpanded {
                Divider()
                    .padding(.bottom, 5)
                ExpandedView(sampleBody, delegate: self)
            }
        }
        .padding()
        .transition(.move(edge: .bottom))
        .background(color.cornerRadius(10.0))
    }
}

