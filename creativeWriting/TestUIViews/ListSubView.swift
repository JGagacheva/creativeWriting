//
//  ListSubView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/23/24.
// MARK: The view of every individual note as it is expanded and reduced in the group of notes.

import SwiftUI

struct ListSubView: View {
    @State var isExpanded = false
    private let color = Color.gray.opacity(0.5)
    let sampleTitle: String
    let sampleBody: String
    
    init(_ sampleTitle: String, _ sampleBody: String) {
        self.sampleTitle = sampleTitle
        self.sampleBody = sampleBody
    }
    
    var body: some View {
        VStack {
            FrontView(sampleTitle)
            if isExpanded {
                Divider()
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
    }
}

