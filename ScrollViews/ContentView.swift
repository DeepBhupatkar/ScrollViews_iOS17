//
//  ContentView.swift
//  ScrollViews
//
//  Created by DEEP BHUPATKAR on 27/03/24.
//

import SwiftUI

struct ContentView: View 

{
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View
    {
        ScrollView(.horizontal)
        {
            HStack{
                ForEach(MockData.items) { item in
                    ZStack {
                        Circle()
                            .containerRelativeFrame(.horizontal, count: verticalSizeClass == .regular ? 1:4, spacing: 10.0)
                            .foregroundStyle(item.color.gradient)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                        
                        Text(item.color.description)
                            .font(.system(.body, design: .monospaced))
                            .foregroundColor(.white)
                    }
                    .scrollTransition { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1.0 : 0.0 )
                            .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3 , y: phase.isIdentity ? 1.0 : 0.3 )
                            .offset(y:phase.isIdentity ? 0 :50 )
                    }
                }

            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}







struct Item: Identifiable {
   let id = UUID()
    let color: Color
}

struct MockData {
    static var items = [Item(color:.teal),
                        Item(color:.pink),
                        Item(color:.indigo),
                        Item(color:.orange),
                        Item(color:.purple),
                        Item(color:.yellow),
                        Item(color:.green),
                        Item(color:.blue),
                        Item(color:.brown),
                        Item(color:.red)]
}

