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
            addSections().tabItem {
                Text("Sections")
                Image(systemName: "tv.fill")
            }
        }
    }
}

struct buttonView: View {
    @State var panelColor: Color = .gray
    @State var panelColorController: Int = 0
    let buttonStringArray: [String] = ["What does this button do?", "What about this one?", "Does this one do anything?", "New section?", "Is this app useless?", "Does this one do anything?"]
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 10).foregroundStyle(panelColor).onTapGesture {
                    
                }
                VStack {
                    Button(buttonStringArray[0], action: {
                        
                    }).buttonStyle(.borderedProminent)
                    
                    Button(buttonStringArray[1], action: {
                        
                    }).buttonStyle(.borderedProminent)
                    
                    Button(buttonStringArray[2], action: {
                        
                    }).buttonStyle(.borderedProminent)
                }
                
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 12).foregroundStyle(panelColor)
                VStack {
                    Button(buttonStringArray[3], action: {
                        
                    }).buttonStyle(.borderedProminent)
                    
                    Button(buttonStringArray[4], action: {
                        
                    }).buttonStyle(.borderedProminent)
                    
                    Button(buttonStringArray[5], action: {
                        
                    }).buttonStyle(.borderedProminent)
                    Text("Tap me and see what happens!").foregroundStyle(.white).padding().background(RoundedRectangle(cornerRadius: 12).foregroundStyle(.blue)).onTapGesture {
                        switch panelColorController {
                        case 0:
                            panelColorController += 1
                            panelColor = .pink
                        case 1:
                            panelColorController += 1
                            panelColor = .green
                        case 2:
                            panelColorController += 1
                            panelColor = .blue
                        case 3:
                            panelColorController = 0
                            panelColor = .gray
                        default:
                            panelColorController = 0
                        }
                    }
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
            
            Text("You have clicked this \(noSpamPlease) times").padding().background(RoundedRectangle(cornerRadius: 12).foregroundStyle(.gray)).onTapGesture {
                noSpamPlease = 0
            }
        }.padding().shadow(radius: 12)
    }
    
}


struct addSections: View {
    @State var numberOfSections: Int = 0
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("+", action: {
                        switch numberOfSections {
                        case 50:
                            numberOfSections += 0
                        default:
                            numberOfSections += 1
                        }
                    }).buttonStyle(.borderedProminent)
                    Button("-", action: {
                        switch numberOfSections {
                        case 0:
                            numberOfSections -= 0
                        default:
                            numberOfSections -= 1
                        }
                    }).buttonStyle(.borderedProminent)
                    Text("Count: \(numberOfSections)").padding(8).foregroundStyle(.white).background(RoundedRectangle(cornerRadius: 12).foregroundStyle(.blue))
                }
                Text("Double Tap to Reset, Max Sections 50").padding(8).foregroundStyle(.white).background(RoundedRectangle(cornerRadius: 12).foregroundStyle(.blue)).onTapGesture(count: 2) {
                    numberOfSections = 0
                }
            }
            ForEach(0..<numberOfSections, id: \.self) { index in
                childSection()
            }
        }.padding()
    }
}

struct childSection: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12).foregroundStyle(.blue)
    }
}

#Preview {
    ContentView()
}
