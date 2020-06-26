//
//  MemoryGame.swift
//  Memorise
//
//  Created by Nulrybek Karshyga on 6/23/20.
//  Copyright © 2020 Nulrybek Karshyga. All rights reserved.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenCard = self.index(of: card)
        self.cards[chosenCard].isFaceUp = !self.cards[chosenCard].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if cards[index].id == card.id{
                return index
            }
        }
        return 0 // TODO: bogus!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        // creates empty array
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    // Identifiable is a constraint(protocol) that enables iterable capabilities
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
