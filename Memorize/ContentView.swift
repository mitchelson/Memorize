//
//  ContentView.swift
//  Memorize
//
//  Created by Mitchelson Silva on 12/09/23.
//

import SwiftUI


// ContentView behaves like a View, se comporta como uma View
struct ContentView: View {
    var emojis = ["👻","🔥", "😁", "🤖", "💩", "👀", "🧶", "🐳", "🍔", "🥤", "🎲", "⏰"]
    @State var cardCount = 4
    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Spacer()
            cardCouyntAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
            ForEach(0..<cardCount, id: \.self){index in
                CardView(content: emojis[index])
                    .aspectRatio(contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCouyntAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack (content: {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            base.fill().opacity(isFaceUp ? 0 : 1)
        })
        .imageScale(.small)
        .foregroundColor(.orange)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
