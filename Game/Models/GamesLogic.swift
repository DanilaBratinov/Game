import UIKit

class Game {
    static let shared = Game()
    
    private init() {}
    
    var computer: GameItem?
    var user = GameItem.paper
    var winner = Winner.draw
    var statics: [Game.Winner] = []
    var gameItem = GameItem.self
            
    enum GameItem: String, CaseIterable {
        case scissors = "✌️"
        case rock = "✊"
        case paper = "✋"
    }
    
    enum Winner: String {
        case user = "✅ Победа"
        case computer = "❌ Поражение"
        case draw = "🤝 Ничья"
    }
    
    enum SettingLabel {
        case text
        case full
        case emoji
    }

    func nextUserItem() -> String {
        switch user {
        case .paper:
            user = .rock
        case .rock:
            user = .scissors
        default:
            user = .paper
        }
        return user.rawValue
    }
    
    func lastUserItem() -> String {
        switch user {
        case .scissors:
            user = .rock
        case .rock:
            user = .paper
        default:
            user = .scissors
        }
        return user.rawValue
    }
    
    func definitionOfTheWinner() {
        if user == .paper && computer == .scissors {
            winner = .computer
        } else if user == .paper && computer == .paper {
            winner = .draw
        } else if user == .paper && computer == .rock {
            winner = .user
        } else if user == .scissors && computer == .scissors {
            winner = .draw
        } else if user == .scissors && computer == .rock {
            winner = .computer
        } else if user == .scissors && computer == .paper {
            winner = .user
        } else if user == .rock && computer == .scissors {
            winner = .user
        } else if user == .rock && computer == .paper {
            winner = .computer
        } else if user == .rock && computer == .rock {
            winner = .draw
        }
    }
    
    func getRandomCompuer() -> GameItem {
        computer = GameItem.allCases.shuffled().randomElement()
        return computer ?? .scissors
    }
}
