//
//  TestView.swift
//  creativeWriting
//
//  Created by Jana Gagacheva on 2/20/24.
//

import SwiftUI

struct TestView: View {
    @State var isExpanded = false
    
    private let sample: Note2 = Note2(
        title: "Tell me about exploring the impact of emerging technologies, such as artificial intelligence and virtual reality, on education?",
        body: """
        I hope this letter finds you well. I wanted to take this opportunity to express my sincere gratitude for all your support and kindness over the years. Your friendship has been a source of immense joy and comfort to me, and I am truly grateful to have you in my life.
        NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. New Line. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. New Line. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. New Line. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. New Line. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. New Line. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. New Line. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. New Line. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine.NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine. NewLine.
        """)

    
    private let color = Color.gray.opacity(0.5)
    @State private var contentSize: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                gradient
                VStack {
                    FrontView(sample.title)
                    if isExpanded {
                        ExpandedView(sample.body)
                    }
                }
                .padding()
                .frame(width: geometry.size.width * 0.8)
                .transition(.move(edge: .bottom))
                .background(color.cornerRadius(10.0))
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    TestView()
}

var gradient: some View {
    LinearGradient(
        gradient: Gradient(colors: [
            Color(red: (130.0 / 255.0), green: (109.0 / 255.0), blue: (210.0 / 255.0)),
            Color(red: (130.0 / 255.0), green: (130.0 / 255.0), blue: (221.0 / 255.0)),
            Color(red: (131.0 / 255.0), green: (160.0 / 255.0), blue: (238.0 / 255.0))
//            Color(red: (145.0 / 255.0), green: (211.0 / 255.0), blue: (112.0 / 255.0)),
//            Color(red: (188.0 / 255.0), green: (160.0 / 255.0), blue: (255.0 / 255.0)),
//            Color(red: (242.0 / 255.0), green: (205.0 / 255.0), blue: (84.0 / 255.0))
        ]),
        startPoint: .top,
        endPoint: .trailing
    )
    .flipsForRightToLeftLayoutDirection(false)
    .ignoresSafeArea()
}
