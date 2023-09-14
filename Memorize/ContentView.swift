//
//  ContentView.swift
//  Memorize
//
//  Created by Mitchelson Silva on 12/09/23.
//

import SwiftUI


// ContentView behaves like a View, se comporta como uma View
struct ContentView: View {
    var body: some View {
        HStack{
            VStack{
                CardView()
                CardView()
                CardView()
                CardView()
            }
            VStack{
                CardView()
                CardView()
                CardView()
                CardView()
            }
            VStack{
                CardView()
                CardView()
                CardView()
                CardView()
            }
            VStack{
                CardView()
                CardView()
                CardView()
                CardView()
            }
        }
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack (content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 3)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.orange)
            }
            
        })
        .imageScale(.small)
        .foregroundColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
