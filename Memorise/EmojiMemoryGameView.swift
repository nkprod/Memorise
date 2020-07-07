//
//  ContentView.swift
//  Memorise
//
//  Created by Nulrybek Karshyga on 6/22/20.
//  Copyright © 2020 Nulrybek Karshyga. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
         HStack() {
            ForEach(viewModel.cards) { card in
                CardView(card: card, quantity: self.viewModel.cards.count).aspectRatio(2/3, contentMode: .fit ).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var quantity: Int
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: self.cornerRadius)
                }
            }.font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.fontScaleNumber ))
        }
        
    }
    // MARK: Drawing constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleNumber: CGFloat = 0.75
}
