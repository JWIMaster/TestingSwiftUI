//
//  ContentView.swift
//  TestingSwiftUI
//
//  Created by JWI Master on 17/6/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            buttonView().tabItem {
                Text("Buttons")
                Image(systemName: "rhombus.fill")
            }
            shapeView().tabItem {
                Text("Shapes")
                Image(systemName: "star.circle")
            }
        }
    }
}

struct buttonView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12).foregroundStyle(.gray)
                VStack {
                    Button("What does this button do?", action: {
                        
                    }).buttonStyle(.borderedProminent)
                    
                    Button("What about this one?", action: {
                        
                    }).buttonStyle(.borderedProminent)
                    
                    Button("Does this one do anything?", action: {
                        
                    }).buttonStyle(.borderedProminent)
                }
                
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 12).foregroundStyle(.gray)
                VStack {
                    Button("New section?", action: {
                        
                    }).buttonStyle(.borderedProminent)
                    
                    Button("Is this app useless?", action: {
                        
                    }).buttonStyle(.borderedProminent)
                    
                    Button("This doesn't even look good?", action: {
                        
                    }).buttonStyle(.borderedProminent)
                }
                
            }
        }.padding().shadow(radius: 12)
    }
}


struct shapeView: View {
    @State var rect1Color: Color = .green
    @State var rect2Color: Color = .blue
    @State var noSpamPlease: Int = 0
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12).foregroundStyle(rect1Color)
            Button("SWAP COLOURS!", action: {
                if rect1Color == .green {
                    rect1Color = .blue
                    rect2Color = .green
                    noSpamPlease += 1
                }
                else if rect1Color == .blue {
                    rect1Color = .green
                    rect2Color = .blue
                    noSpamPlease += 1
                }
            }).buttonStyle(.borderedProminent)
            RoundedRectangle(cornerRadius: 12).foregroundStyle(rect2Color)
            
            Text("You have clicked this \(noSpamPlease) times").padding().background(RoundedRectangle(cornerRadius: 12).foregroundStyle(.gray))
        }.padding()
    }
    
}

#Preview {
    ContentView()
}
