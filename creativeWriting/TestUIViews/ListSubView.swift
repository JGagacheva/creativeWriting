//
//  ListSubView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
// MARK: The view of every individual note as it is expanded and reduced in the group of notes.

import SwiftUI

struct ListSubView: View, Delegate {
    @State var isExpanded = false
    
    private let color = Color.gray.opacity(0.5)
    let sampleTitle: String
    let sampleBody: String
    let onDelete: (() -> ())?
    
    init(_ sampleTitle: String, _ sampleBody: String, onDelete: (() -> ())?) {
        self.sampleTitle = sampleTitle
        self.sampleBody = sampleBody
        self.onDelete = onDelete
    }
    
    func deletemeh() {
        onDelete?()
    }
    
    var body: some View {
        VStack {
            FrontView(sampleTitle)
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
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

