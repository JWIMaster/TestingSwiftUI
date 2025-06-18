//
//  ContentViewV2.swift
//  TestingSwiftUI1
//
//  Created by JWI Master on 18/6/2025.
//

import SwiftUI
import UIKit

struct ContentViewV2: View {
    var body: some View {
        TabView {
            listView().tabItem {
                Text("Lists")
                Image(systemName: "list.bullet.rectangle.fill")
            }
            colorChangingRectangle().tabItem {
                Text("Colors")
                Image(systemName: "pencil.and.outline")
            }
        }
    }
}

struct listView: View {
    @State var listedItems: [Int] = Array(1...20)
    var body: some View {
            List {
                Section(header: Text("This is a list")) {
                    ForEach(listedItems, id:\.self) { item in
                        Text("\(item)")
                    }
                }
            }
    }
}

struct colorChangingRectangle: View {
    @State var colorChanger: Color = .black
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12).fill(colorChanger).scaledToFit().onTapGesture {
                colorChanger = Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
            }.animation(.easeInOut, value: colorChanger)
            
            Text("Tap to change color!").padding(8).foregroundColor(.white).background(RoundedRectangle(cornerRadius: 12).foregroundColor(.blue))
        }.padding().shadow(radius: 12)
    }
}






#Preview {
    ContentViewV2()
}
