//
//  ContentView.swift
//  Memorise
//
//  Created by Nulrybek Karshyga on 6/22/20.
//  Copyright © 2020 Nulrybek Karshyga. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var newElement = 10
    var anotherNewElement = 11
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
         HStack() {
            ForEach(viewModel.cards) { card in
                CardView(card: card, quantity: self.viewModel.cards.count).onTapGesture {
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
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                quantity <= 4 ? Text(card.content).font(Font.largeTitle) : Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0)
            }
        }
    }
}
