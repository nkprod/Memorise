//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Nulrybek Karshyga on 6/25/20.
//  Copyright © 2020 Nulrybek Karshyga. All rights reserved.
//

import SwiftUI
import Combine

class EmojiMemoryGame: ObservableObject {
    
    // type of the card content
    // Published makes sure that if something is changed in the Model, those changes will be sent(reflected) to the View
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // static makes it possible to have a func assigned to the type "EmojiMemoryGame" and not its instance
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = ["🥊","🥅", "🎱","🥊","🥅", "🎱"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            let randomIndex = Int.random(in: 0..<emojis.count)
            let emoji = emojis[randomIndex]
            emojis.remove(at: randomIndex)
            return emoji
        }
    }
    
     
    
    //MARK: Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: Intent(s)
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
