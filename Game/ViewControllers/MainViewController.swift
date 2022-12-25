import UIKit

final class MainViewController: UIViewController {
    
    private let logic = Game.shared
    private var timer: Timer?
    private var secondeTimer: Timer?
    
    //    MARK: - IBOutlets
    @IBOutlet var userTextView: UILabel!
    @IBOutlet var computerTextView: UILabel!
    @IBOutlet var vsLabel: UILabel!
    
    //    MARK: - ViewDidLoad
    override func viewDidLoad() {
        navigationItem.backButtonTitle = "Назад"
    }
    
    
    //    MARK: - UserActions
    @IBAction func changeItemButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            userTextView.opacity()
            userTextView.text = logic.lastUserItem()
            sender.pulsate()
        default:
            userTextView.opacity()
            userTextView.text = logic.nextUserItem()
            sender.pulsate()
        }
    }
    
    @IBAction func startRaundButton(_ sender: UIButton) {
        if userTextView.text != "Вы" && timer?.isValid != true {
            logic.computer = logic.getRandomCompuer()
            startTimer()
            sender.pulsate()
            if vsLabel.text != "VS" {
                vsLabel.text = "VS"
                vsLabel.opacity()
            }
        }
    }
}

    //    MARK: - Timer
extension MainViewController {
    @objc private func updateTimer() {
        logic.computer = logic.getRandomCompuer()
        computerTextView.opacity()
        computerTextView.text = logic.computer?.rawValue
    }
    
    @objc private func stopTimer() {
        timer?.invalidate()
        computerTextView.text = logic.computer?.rawValue
        logic.definitionOfTheWinner()
        switch logic.winner {
        case .computer:
            vsLabel.text = "Поражение 😔"
            vsLabel.fadeIn()
            logic.statics.insert(logic.winner, at: 0)
        case .user:
            vsLabel.text = "Победа 😁"
            vsLabel.fadeIn()
            logic.statics.insert(logic.winner, at: 0)
        case .draw:
            vsLabel.text = "Ничья 😌"
            vsLabel.fadeIn()
            logic.statics.insert(logic.winner, at: 0)
        }
    }
    
    private func startTimer() {
        secondeTimer = Timer.scheduledTimer(timeInterval: 3.0,
                                            target: self,
                                            selector: #selector(stopTimer), userInfo: nil, repeats: false)
        
        timer = Timer.scheduledTimer(timeInterval: 0.2,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil, repeats: true)
    }
    
}
